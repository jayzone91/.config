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
  indent = { enable = true },
  autotag = {
    enable = true
  },
  additional_vim_regex_highlighting = false,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremetntal = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>"
    }
  }
})
