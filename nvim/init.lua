----------------
--- Init.lua ---
----------------

-- Set Leader-Key first, then load Plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load Neovim Config
require("base")

-- Check if Lazy is installed, if not install it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  defaults = {
    lazy = true,
    version = false,
  },
  checker = { enabled = true },
  spec = {
    { import = "Plugins" }, -- Import every File in Plugins Folder
  },
}, {})

require("Config") -- Load Plugin Config

--Load LSP Config
-- require("Config.lsp")

require("autocmd")  -- Load Autocmds

require("mappings") -- Load your custom Mappings
