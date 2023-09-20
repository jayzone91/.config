return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  opts = {
    ensure_installed = {
      "pyright",
      "ruff-lsp",
      "debugpy",
      "isort",
      "taplo",
      "black"
    }
  }
}
