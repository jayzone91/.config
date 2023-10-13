-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "


---------------
--- Options ---
---------------
local o = vim.o

-- Copy indent from current line when starting a new line.
o.autoindent = true

-- When a file has been detected to have been changed outside of Vim and
-- it has not been changed inside of Vim, automatically read it again
o.autoread = true

-- Write the content of the file, if it has been modified.
o.autowrite = true

-- Set default colorscheme to dark
o.background = "dark"

-- Influences Backspace in Insert mode.
o.backspace = "indent,eol,start"

-- Make a backup before overwriting a file
o.backup = false

-- Sync Vim with system clipboard
local has = vim.fn.has
if has("win32") == 1 then
  vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end
if has("macunix") == 1 then
  vim.opt.clipboard:append({ "unnamedplus" })
end

-- Number of screen lines to use for the command line
o.cmdheight = 1

-- Options for Insert mode completion
o.completeopt = "menu,menuone,noinsert"

-- When confirm is on, certain operations that would normally fail
-- becaus of unsaved changes to a buffer, instead raise a dialog asking
-- if you wish to save the current file(s)
o.confirm = true

-- Copy the structure of the existing lines indent when autoindenting new line.
o.copyindent = true

-- Highlight the text line of the cursor.
o.cursorline = true

-- Unicode characters are considerd to be full width
o.emoji = true

-- In insert mode: Use the approriate number of spaces to insert a <tab>
o.expandtab = true

-- Format to recognize for the ":grep" command output
o.grepformat = "%f:%l:%c:%m"

-- Program to use for the :grep command.
o.grepprg = "rg --vimgrep"

-- Highlight all matches from search pattern
o.hlsearch = true

-- Ignore case in search patterns.
o.ignorecase = true

o.inccommand = "nosplit"

o.iskeyword = "@,48-57,_,192-255,-"

o.laststatus = 0

o.linebreak = true

-- Show tabs and trailing spaces
o.list = true

-- enable mouse support
o.mouse = "a"

-- mouse scroll
o.mousescroll = "ver:3,hor:6"

-- Show line numbers
o.number = true

-- Pseudo transparency for popup menus
o.pumblend = 10

-- Maximum number of entries in popup menu
o.pumheight = 10

-- Show relative line numbers
o.relativenumber = true

-- number of lines to keep above and below the cursor
o.scrolloff = 4

-- round indent
o.shiftround = true

-- Number of spaces to use as tab
o.shiftwidth = 2

vim.opt.shortmess:append({ W = true, I = true, c = true })

o.showcmd = true

-- hide mode because we have a statusline
o.showmode = false

-- always show signcolumn
o.signcolumn = "yes"

-- use case sensitive if you use capitals in the search
o.smartcase = true

-- use spaces as tab
o.smarttab = true

-- number of spaces that a tab count for
o.softtabstop = 2

-- split windows always below current one
o.splitbelow = true

-- split windows always right
o.splitright = true

-- dont use swapfile
o.swapfile = false

-- number of spaces
o.tabstop = 2

-- enable true colors
o.termguicolors = true

-- timeout
o.timeout = true
o.timeoutlen = 300

-- display the title
o.title = true

-- update time
o.updatetime = 300

o.wildmode = "longest:full,full"

--line wrap
o.wrap = false

-- spelling
o.spell = true
o.spelllang = "en"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
