local replh = require("nvim-dap-repl-highlights")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

replh.setup()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()


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
  capabilities = capacilities,
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
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
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
})
