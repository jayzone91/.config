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
vim.o.softtabstop = 2
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
vim.o.pumblend = 10
vim.opt.pumheight = 10
vim.o.wrap = false
vim.opt.autowrite = true
vim.opt.conceallevel = 3
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.inccommand = "nosplit"
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.shiftround = true
vim.opt.shortmess:append({
  W = true, I = true, c = true
})
vim.opt.wildmode = "longest:full,full"
vim.g.markdown_recommended_style = 0
vim.o.colorcolumn = "75"


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
