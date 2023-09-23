local replh = require("nvim-dap-repl-highlights")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

replh.setup()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
local fmt = require("luasnip.extras.fmt").fmt
local snippet = luasnip.snippet
local insert_node = luasnip.insert_node
local function_node = luasnip.function_node
local dynamic_node = luasnip.dynamic_node
local snippet_node = luasnip.snipped_node
local rep = require("luasnip.extras").rep

local function get_prop_names(id_node)
  local object_type_node = id_node:child(2)
  if object_type_node:type() ~= "object_type" then
    return {}
  end
  local prop_names = {}
  for prop_signature in object_type_node:iter_children() do
    if prop_signature:type() == "property_signature" then
      local prop_iden = prop_signature:child(0)
      local prop_name = vim.treesitter.query.get_node_text(prop_iden, 0)
      prop_names[#prop_names + 1] = prop_name
    end
  end
  return prop_names
end

luasnip.add_snippets("typescriptreact", {
  snippet(
    "comp",
    fmt(
      [[
{}interface {}Props{{
  {}
}}

export const {} = ({{ {} }}: {}Props) => {{
  return {};
}}
      ]], {
        insert_node(1, "export "),
        dynamic_node(2, function(_, snip)
          local dirname = vim.fn.expand("%"):match("([^/]+)/[^/]+$")
          local filename = vim.fn.expand("%:t")
          if filename == "index.tsx" then
            return snippet_node(nil, {
              insert_node(1, dirname),
            })
          end

          return snippet_node(nil, {
            insert_node(1, vim.fn.substitute(snip.env.TM_FILENAME, "\\..*$", "", "g")),
          })
        end, { 1 }),
        insert_node(3, "// Props"),
        dynamic_node(4, function(_, snip)
          local dirname = vim.fn.expand("%"):match "([^/]+)/[^/]+$"
          local filename = vim.fn.expand("%:t")
          if filename == 'index.tsx' then
            return snippet_node(nil, {
              insert_node(1, dirname),
            })
          end

          return snippet_node(nil, {
            insert_node(1, vim.fn.substitute(snip.env.TM_FILENAME, "\\..*$", "", "g")),
          })
        end, { 1 }),
        function_node(function(_, snip, _)
          local pos_begin = snip.nodes[6].mark:pos_begin()
          local pos_end = snip.nodes[6].mark:pos_end()
          local parser = vim.treesitter.get_parser(0, "tsx")
          local tstree = parser:parse()

          local node = tstree[1]
              :root()
              :named_descendant_for_range(pos_begin[1], pos_begin[2], pos_end[1], pos_end[2])

          while node ~= nil and node:type() ~= "interface_declaration" do
            node = node:parent()
          end

          if node == nil then
            return ""
          end

          -- `node` is now surely of type "interface_declaration"
          local prop_names = get_prop_names(node)

          -- Does this lua->vimscript->lua thing cause a slow down? Dunno.
          return vim.fn.join(prop_names, ", ")
        end, { 3 }),
        rep(2),
        insert_node(5, "null"),
      }
    )
  )
})

luasnip.config.setup({})

require("neodev").setup()

local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.buf.inlay_hint(bufnr, true)
  end
end

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        checkThirdParty = false
      },
      telemetry = { enable = false },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    codeActionsOnSave = {
      enabel = true,
      mode = "all",
    },
  },
})

lspconfig.tsserver.setup({})

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

lspconfig.marksman.setup({})

lspconfig.prismals.setup({})

lspconfig.clangd.setup({})

lspconfig.taplo.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.ruff_lsp.setup({
  settings = {
    organizeImports = false,
  },
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
})

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
    "typescript",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})

local cmp = require("cmp")
local defaults = require("cmp.config.default")
cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "npm" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "calc" },
    {
      name = "spell",
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      }
    }
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.locality,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.offset,
      cmp.config.compare.sort_text,
      cmp.config.compare.order,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    }),
  },
  experimental = {
    ghost_text = true,
  },
  performance = {
    max_view_entries = 100,
  },
})
