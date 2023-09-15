return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
    end,
    opts = {
      key_labels = {
        ["<space>"] = "Space",
        ["<cr>"] = "Return",
        ["<tab>"] = "Tab",
        ["<Down>"] = "",
        ["<Left>"] = "",
        ["<Up>"] = "",
        ["<Right>"] = "",
        ["<esc>"] = "ESC",
        ["<bs>"] = "Backspace",
      }
    }
  }
}
