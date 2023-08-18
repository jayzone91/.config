vim.g.loaded_netwr = 1
vim.g.leaded_netrwPlugin = 1

vim.o.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30
  },
  renderer = {
    group_empty = true,
    highlight_git = true,

  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})
