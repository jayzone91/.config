return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  opts = {},
  config = function()
    local wk = require("which-key")
    wk.register({
      c = {
        name = "Code Actions",
      },
      g = {
        name = "+LSP",
      },
      q = {
        name = "Quit",
      },
    }, { prefix = "<leader>" })
  end,
}
