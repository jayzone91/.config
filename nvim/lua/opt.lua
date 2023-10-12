local o = vim.opt

o.autowrite = true          -- Enable auto write
o.clipboard = "unnamedplus" -- Sync with system clipboard
o.completeopt = "menu,menuone,noselect"
o.conceallevel = 3          -- Hide * markup for bold and italic
o.confirm = true            -- Confirm to save changes before exiting modified buffer
o.cursorline = true         -- Enable highlighting of the current line
o.expandtab = true          -- Use spaces instead of tabs
o.formatoptions = "jcroqlnt"
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"
o.ignorecase = true      -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.laststatus = 3         -- global statusline
o.list = true            -- Show some invisible characters (tabs ...)
o.mouse = "a"            -- Enable mouse mode
o.number = true          -- Print line number
o.pumblend = 10          -- Pupup blend
o.pumheight = 10         -- Maximum Numver of entries in a popup
o.relativenumber = true  -- Relative line numbers
o.scrolloff = 4          -- lines of context
o.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "globals",
  "skiprtp"
}
o.shiftround = true    -- Round indent
o.shiftwidth = 2       -- Size of an indent
o.shortmess:append({ W = true, I = true, c = true, C = true })
o.showmode = false     -- Dont show mode since we have a statusline
o.sidescrolloff = 8    -- Columns of context
o.signcolumn = "yes"   -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true     -- Don´t ignore case with capitals
o.smartindent = true   -- Insert indents automatically
o.spelllang = { "en" } -- Spell Checking
o.splitbelow = true    -- Put new window below current
o.splitkeep = "screen"
o.splitright = true    -- Put new window right of current
o.tabstop = 2          -- Number of spaces tabs count for
o.termguicolors = true -- True Color Support
o.timeoutlen = 300
o.undofile = true
o.undolevels = 300
o.updatetime = 200               -- Save swap file and trigger CursorHold
o.virtualedit = "block"          -- Allow Cursor to move where there is no text in visual block mode
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5                -- Minimum window width
o.wrap = false                   -- Disable line wrap
o.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
  o.smoothscroll = true
end
