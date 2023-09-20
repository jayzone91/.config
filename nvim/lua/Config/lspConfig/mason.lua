require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "eslint",
    "tsserver",
    "taplo",
    "rust_analyzer",
    "marksman",
    "prismals",
    "clangd",
    "emmet_ls"
  },
  automatic_installation = true,
})
