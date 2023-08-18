vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.hlsearch = true
vim.o.number = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.scrolloff = 10
vim.o.backup = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.swapfile = false
vim.o.timeoutlen = 300
vim.o.updatetime = 300
vim.o.writebackup = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes"
vim.opt.backspace = { "indent", "eol", "start" }
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.iskeyword:append("-")
vim.o.pumblend = 5

local has = vim.fn.has
if has("macunix") == 1 then
  vim.opt.clipboard:append({ "unnamedplus" })
end
if has("win32") == 1 then
  vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end

-- UNdercurl

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-------------------------
--- Highlight on Yank ---
-------------------------

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
