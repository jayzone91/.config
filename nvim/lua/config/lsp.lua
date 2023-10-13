local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_format_on_save = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip").config.setup({})

require("neodev").setup()

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_format_on_save(bufnr)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "rust_analyzer",
    "marksman",
    "prismals",
    "clangd",
    "sqlls",
    "cssls"
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      runtime = { version = "LuaJit" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false
      },
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities
})

require("lspconfig").rust_analyzer.setup({
  settings = {
    ["rust_analyzer"] = { diagnostics = { enable = true } }
  }
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  completion = { completeopt = "menu,menuone,noinsert" },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("lausnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "npm" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
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
