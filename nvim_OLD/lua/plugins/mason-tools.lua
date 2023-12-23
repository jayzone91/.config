return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "prettierd",
          "prettier",
          "autopep8",
          "eslint_d",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
}
