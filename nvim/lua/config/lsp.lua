require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "eslint",
    "tsserver",
    "pyright",
    "rust_analyzer",
    "marksman",
    "prismals",
    "clangd",
  },
  automatic_installation = true,
})



local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()

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
      telemetry = { enable = false }
    }
  },
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.eslint.setup {
  on_attach    = on_attach,
  capabilities = capabilities,
  settings     = {
    codeActionOnSave = {
      enable = true,
      mode = "all"
    }
  }
}

lspconfig.tsserver.setup {}

lspconfig.pyright.setup {}

lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true
      }
    }
  }
}

lspconfig.marksman.setup {}

lspconfig.prismals.setup {}

lspconfig.clangd.setup {}

local cmp = require("cmp")
cmp.setup {
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
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "buffer" },
    { name = "path" }
  },
}
