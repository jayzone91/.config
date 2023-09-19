require("telescope").setup({
  defaults               = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
  },
  file_sorter            = require("telescope.sorters").get_fuzzy_file,
  file_ignore_pattern    = { "node_modules" },
  generic_sorter         = require("telescope.sorters").get_generic_fuzzy_sorter,
  path_display           = { "truncate" },
  winblend               = 0,
  border                 = {},
  borderchars            = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  color_devicons         = true,
  set_env                = { ["COLORTERM"] = "truecolor" },
  file_previewer         = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer         = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer       = require("telescope.previewers").vim_buffer_qflist.new,
  buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  mappings               = {
    n = { ["q"] = require("telescope.actions").close },
  },
  extensions_list        = { "themes", "terms" },
}
)

pcall(require("telescope").load_extension, "fzf")
require("telescope").load_extension("harpoon")
