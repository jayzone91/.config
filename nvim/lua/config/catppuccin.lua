require("catppuccin").setup({
  transparent_background = true,
  term_colors = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    barbecue = {
      dim_dirname = true, -- directory name is dimmed by default
      bold_basename = true,
      dim_context = false,
      alt_background = false,
    },
    fidget = true,
    harpoon = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    mason = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
      inlay_hints = {
        background = true,
      },
    },
    navic = {
      enable = true,
      custom_bg = "NONE", -- "lualine" will set background to mantle
    },
    telescope = {
      enabled = true,
    },
    lsp_trouble = true,
    illuminate = {
      enable = true,
      lsp = true,
    },
    which_key = true,
  }
})

vim.cmd.colorscheme("catppuccin")
