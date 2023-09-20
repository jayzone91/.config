require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "eslint",
    "tsserver",
    "pyright",
    "ruff-lsp",
    "debugpy",
    "taplo",
    "rust_analyzer",
    "marksman",
    "prismals",
    "clangd",
    "emmet_ls"
  },
  automatic_installation = true,
})
