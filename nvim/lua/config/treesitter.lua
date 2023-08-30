require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "typescript",
    "javascript",
    "python",
    "rust",
    "markdown",
    "prisma",
    "c",
    "cpp",
  },
  sync_install = true,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true
  },
  additional_vim_regex_highlighting = false,
})
