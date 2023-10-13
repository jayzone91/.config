require("base")
require("mappings")
require("autocmds")

----------------------------
--- Lazy Package Manager ---
----------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- Your plugins will be read from the lua/plugins folder
    { import = "plugins" }
  },
  defaults = {
    lazy = false,
    version = false            -- always use latest git commit
  },
  checker = { enable = true }, -- check for Updates on start
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("config.lsp")
require("config.treesitter")
