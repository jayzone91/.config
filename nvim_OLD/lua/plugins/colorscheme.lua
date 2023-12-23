return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",
      disable_background = true,
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
