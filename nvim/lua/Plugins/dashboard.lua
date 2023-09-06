return {
  'glepnir/dashboard-nvim',
  event = "VimEnter",
  lazy = false,
  config = function()
    require("dashboard").setup {
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = " Update",
            group = "@property",
            acion = "LazyUpdate",
            key = "u",
          },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
        }
      }
    }
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}
