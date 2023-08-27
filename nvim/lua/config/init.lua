if vim.fn.has("win32") == 1 then
  require("config.catppuccin")
else
  require("config.neosolarized")
end
require("config.lsp")
require("config.treesitter")
require("config.nvim-tree")
require("config.lualine")
require("config.git")
require("config.which-key")
