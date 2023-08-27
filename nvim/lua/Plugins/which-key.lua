return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        ["<space>"] = "Space",
        ["<cr>"] = "Return",
        ["<tab>"] = "TAB",
        ["<down>"] = "",
        ["<left>"] = "",
        ["<up>"] = "",
        ["<right>"] = "",
        ["<esc>"] = "ESC",
      }
    }
  }
}
