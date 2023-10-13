return {
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = true,
    keys = {
      {
        "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)"
      },
      {
        "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)"
      },
      {
        "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo"
      },
      {
        "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme"
      }
    }
  }
}
