return {
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    opts = {}
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    opts = {
      hide_cursor = true,
      stop_eof = true,
      respect_srolloff = true,
      easing_function = nil,
      pre_hook = nil,
      post_hook = nil,
      performance_mode = false,
    }
  }
}
