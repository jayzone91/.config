return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        --- @usage "auto"|"main"|"moon"|"dawn"
        variant = "auto",
        --- @usage "main"|"moon"|"dark"
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = false,
      })

      vim.cmd("colorscheme rose-pine")
    end
  }
}
