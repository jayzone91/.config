-------------------
--- Base Config ---
-------------------

--[[
Copy indent from current line when starting a new line
boolean
]]
vim.o.autoindent = true

--[[
when a file has been detected to have been changed outside of Vim
and has not been canged inside of Vim, automatically read it again.
boolean
]]
vim.o.autoread = true

--[[
Write the contents of the file, if it has been modified, on each
:next, :rewind, :last, :first, :previous, :stop,
:suspend, :tag, :!, :make, CTRL-] and CTRL-^ command; and when
a :buffer, CTRL-O, CTRL-I, '{A-Z0-9}, or{A-Z0-9} command takes one
to another file.
A buffer is not written if it becomes hidden, e.g. when 'bufhidden' is
set to "hide" and :next is used.
Note that for some commands the 'autowrite' option is not used, see
'autowriteall' for that.
Some buffers will not be written, specifically when 'buftype' is
"nowrite", "nofile", "terminal" or "prompt".
USE WITH CARE: If you make temporary changes to a buffer that you
don't want to be saved this option may cause it to be saved anyway.
Renaming the buffer with ":file {name}" may help avoid this.
]]
vim.o.autowrite = true

--[[
When set to "dark" or "light", adjusts the default color groups
for that backgound type.
]]
vim.o.background = "dark"

--[[
Influences the working od <BS>, <Del>, CTRL-W and CTRL-D in Insert mode.
Each item allows a way to backspace over something:
value	effect
indent	allow backspacing over autoindent
eol	allow backspacing over line breaks (join lines)
start	allow backspacing over the start of insert; CTRL-W and CTRL-U
	stop once at the start of insert.
nostop	like startm except CTRL-W and CTRL-U do not stop at the start of
	insert.
]]
vim.o.backspace = "indent,eol,start"

--[[
Make a backup before overwriting a file.
]]
vim.o.backup = false

--[[
This option is a list of comma-separated names.
]]
if vim.fn.has("macunix") == 1 then -- MacOs
  vim.opt.clipboard:append({ "unnamedplus" })
end
if vim.fn.has("win32") == 1 then -- Windows
  vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end

--[[
Number of screen lines to use for the command-line
]]
vim.o.cmdheight = 1

--[[
colorcolumn is a comma-separated list of screen columns that are
highlighted with ColorColumn hl-ColorColumn. Useful to align text.
]]
vim.o.colorcolumn = "75"

--[[
A comma-separated list of options for Insert mode completion.
]]
vim.o.completeopt = "menu,menuone,noselect"

--[[
Determine how text with the "conceal" syntax attribute :syn-conceal
  is shown:
  Value Effect
  0     Text is shown normally
  1     Each block of concealed text is replaced with one
        character.  If the syntax item does not have a custom
        replacement character defined (see :syn-cchar) the
        character defined in 'listchars' is used.
        It is highlighted with the "Conceal" highlight group.
  2     Concealed text is completely hidden unless it has a
        custom replacement character defined (see
        :syn-cchar).
  3     Concealed text is completely hidden.
  Note: in the cursor line concealed text is not hidden, so that you can
  edit and copy the text.  This can be changed with the 'concealcursor'
  option.
]]
vim.o.conceallevel = 3

--[[
Highlight the text line of the cursor.
]]
vim.o.cursorline = true

--[[
When on all Unicode emoji characters are considered to be full width.
]]
vim.o.emoji = true

--[[
In Insert Mode: Use the appropiate number of spaces to insert a <Tab>.
Spaces are used in indents when "autoindent" is on.
]]
vim.o.expandtab = true

--[[
File-content encoding for the current buffer.
When fileencoding is not UTF-8, conversion will be done when writing
the file.
WARNING: Conversion to a non-Unicode encoding can cause loss of
information!
]]
vim.o.fileencoding = "UTF-8"

--[[
When set to "all", a fold is closed when the cursor isn´t in it and
its level is higher then "foldlevel". Usefull if you want folds to
automatically close when moving out of them
]]
vim.o.foldclose = ""

--[[
When and how to draw the foldcolumn.
default "0"
]]
vim.o.foldcolumn = "0"

--[[
When off, all folds are open. This option can be used to quickly switch
between showing all text unfolded and viewing the text with folds.
It can be toggled with the zi command.
The foldcolumn will remain blank when foldenable is off
]]
vim.o.foldenable = true

--[[
The kind of folding used for the current window.
manual  Fold are created manually
indent  Lines with equal indent form a fold
expr    foldexpr gives the fold level of a line
marker  Markers are used to specify folds
diff    Fold text that is not changed
]]
vim.o.foldmethod = "manual"

--[[
Set the number of screenlines above which a fold can be displayed closed.
Also for manually closed folds.
With the value of 1 a fold can be closed if it takes up two or more
screen lines.
Set to zero to be able to close folds of just one screen line.
Note that this only has an effect on what is displayed.
]]
vim.o.foldminlines = 1

--[[
This is a sequence of letters which describes how automatic
formatting is to be done.  See fo-table.  Commas can be inserted for
readability.
To avoid problems with flags that are added in the future, use the
"+=" and "-=" feature of ":set" add-option-flags.
]]
vim.o.formatoptions = "jcroqlnt"

--[[
Format to recognize for the ":grep" command output.
This is a scanf-like string that uses the same format as the "errorformat"
option.
]]
vim.o.grepformat = "%f:%l:%c:%m"

--[[
Program to use fpr the :grep command.
]]
vim.o.grepprg = "rg --vimgrep"

--[[
When there is a previous search pattern, highlight all its matches.
]]
vim.o.hlsearch = true

--[[
Ignore case in search patterns. Also used when searching in the tags
file.
]]
vim.o.ignorecase = true

--[[
When nonempty, shows the effects of :substitute, :smagic,
:snomagic and user commands with the :command-preview flag as you
type.
Possible values:
  nosplit Shows the effects of a command incrementally in the
    			buffer.
	split	  Like "nosplit", but also shows partial off-screen
	  		  results in a preview window.
If the preview for built-in commands is too slow (exceeds
'redrawtime') then 'inccommand' is automatically disabled until
Command-line-mode is done.
]]
vim.o.inccommand = "nosplit"

--[[
Keywords are used in searching and recognizing with many command.
It is also used for "\k" in a pattern.
]]
vim.o.iskeyword = "@,48-57,_,192-255,-"

--[[
The value of this option influences when the last window will have a
status line:
  0: never
  1: only if there are at lease two windows
  2: always
  3: always and ONLY the last window
Whe screen looks nicer with a status line if you have several windows,
bit it takes another screen-line
default: 2
]]
vim.o.laststatus = 0

--[[
If on, Vim will wrap long lines at a character in 'breakat' rather
than at the last character that fits on the screen.  Unlike
'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
it only affects the way the file is displayed, not its contents.
If 'breakindent' is set, line is visually indented. Then, the value
of 'showbreak' is used to put in front of wrapped lines. This option
is not used when the 'wrap' option is off.
Note that <Tab> characters after an <EOL> are mostly not displayed
with the right amount of white space.
]]
vim.o.linebreak = true

--[[
List mode: By default, show tabs as ">", trailing spaces as "-", and
non-breakable space characters as "+". Useful to see the difference
between tabs and spaces and for trailing blanks. Further changed by
the 'listchars' option.
]]
vim.o.list = true

--[[
Enables mouse support.
Mouse support can be enabled for different modes:
n       Normal Mode
v       Visual Mode
i       Insert Mode
c       Command-Line Mode
h       all previous modes when editing a help file
a       all previous modes
r       for "hit-enter" and "more-prompt" prompt
]]
vim.o.mouse = "a"

--[[
This option controls the number of lines / column to scroll by when
scrolling with a mouse wheel. The option is a comma-separated list.
Each part consists of a direction and a count as follows:
        direction:count,direction:count
You can disable mouse scrolling by using a count of 0.
]]
vim.o.mousescroll = "ver:3,hor:6"

--[[
Print the line number in front of each line. When the "n" option is
excluded from "cpoptions" a wrapped line will not use the column of
line numbers.
]]
vim.o.number = true

--[[
Enabled pseude-transparency for the popup-menu. Valid values are in the
range if 0 for fully opaque popupmenu (disabled) to 100 for fully
transparent baclground. Values between 0-30 are typically most useful.
default: 0
]]
vim.o.pumblend = 10

--[[
Maximum number of icons to show in the popup menu. Zero means
"use available screen space".
]]
vim.o.pumheight = 10

--[[
Show the line number relative to the line with the cursor in front of
each line. Relative numbers help you use the count you can precede
some vertical motion commands with, without having to calculate it
yourself.
]]
vim.o.relativenumber = true

--[[
Minimal number if screen lines to keep above and below the cursor.
This will make some context visible around where you are working.
]]
vim.o.scrolloff = 10

--[[
Round indent to multiple of 'shiftwidth'.  Applies to > and <
commands.  CTRL-T and CTRL-D in Insert mode always round the indent to
a multiple of 'shiftwidth' (this is Vi compatible).
]]
vim.o.shiftround = true

--[[
Number of spaces to use for each step of (auto)indent.
default: 8
]]
vim.o.shiftwidth = 2

--[[
This option helps to avoid all the hit-enter prompts caused by file
messages, for example  with CTRL-G, and to avoid some other messages.
It is a list of flags:
 flag	meaning when present
  f	use "(3 of 5)" instead of "(file 3 of 5)"		shm-f
	  i	use "[noeol]" instead of "[Incomplete last line]"	shm-i
	  l	use "999L, 888B" instead of "999 lines, 888 bytes"	shm-l
	  m	use "[+]" instead of "[Modified]"			shm-m
	  n	use "[New]" instead of "[New File]"			shm-n
	  r	use "[RO]" instead of "[readonly]"			shm-r
	  w	use "[w]" instead of "written" for file write message	shm-w
		and "[a]" instead of "appended" for ':w >> file' command
	  x	use "[dos]" instead of "[dos format]", "[unix]"		shm-x
		instead of "[unix format]" and "[mac]" instead of "[mac
		format]"
	  a	all of the above abbreviations				shm-a
	  o	overwrite message for writing a file with subsequent	shm-o
		message for reading a file (useful for ":wn" or when
		'autowrite' on)
	  O	message for reading a file overwrites any previous	shm-O
		message;  also for quickfix message (e.g., ":cn")
	  s	don't give "search hit BOTTOM, continuing at TOP" or	shm-s
		"search hit TOP, continuing at BOTTOM" messages; when using
		the search count do not show "W" after the count message (see
		S below)
	  t	truncate file message at the start if it is too long	shm-t
		to fit on the command-line, "<" will appear in the left most
		column; ignored in Ex mode
	  T	truncate other messages in the middle if they are too	shm-T
		long to fit on the command line; "..." will appear in the
		middle; ignored in Ex mode
	  W	don't give "written" or "[w]" when writing a file	shm-W
	  A	don't give the "ATTENTION" message when an existing	shm-A
		swap file is found
	  I	don't give the intro message when starting Vim,		shm-I
		see :intro
	  c	don't give ins-completion-menu messages; for		shm-c
		example, "-- XXX completion (YYY)", "match 1 of 2", "The only
		match", "Pattern not found", "Back at original", etc.
	  C	don't give messages while scanning for ins-completion	shm-C
		items, for instance "scanning tags"
	  q	use "recording" instead of "recording @a"		shm-q
	  F	don't give the file info when editing a file, like	shm-F
		:silent was used for the command
	  S	do not show search count message when searching, e.g.	shm-S
		"[1/5]"
	This gives you the opportunity to avoid that a change between buffers
	requires you to hit <Enter>, but still gives as useful a message as
	possible for the space available.  To get the whole message that you
	would have got with 'shm' empty, use ":file!"
	Useful values:
	    shm=	No abbreviation of message.
	    shm=a	Abbreviation, but no loss of information.
	    shm=at	Abbreviation, and truncate message when necessary.
]]
vim.opt.shortmess:append({
  W = true, I = true, c = true
})

--[[
Show (partial) command in the last line of the screen.  Set this
option off if your terminal is slow.
]]
vim.o.showcmd = true

--[[
If in Insert, Replace or Visual mode put a message on the last line.
default true
]]
vim.o.showmode = false

--[[
The minmal number of columns to scroll horizontally. Used only when
the "wrap" option is off and the cursor is moved off of the screen.
When it is zero the cursor will be put in the middle of the screen.
]]
vim.o.sidescroll = 0

--[[
The minimal number of screen columns to keep to the left and to the
right of the cursor if "nowrap" is set.
]]
vim.o.sidescrolloff = 0

--[[
When and how to draw the signcolumn.
]]
vim.o.signcolumn = "yes"

--[[
Override the "ignorecase" option if the search pattern contains upper
case characters. Only used when the search pattern is typed and
"ignorecase" option is on
]]
vim.o.smartcase = true

--[[
Do smart autoindenting when starting a new line.
]]
vim.o.smartindent = true

--[[
When on, a <Tab> in front of a line inserts blanks according to
"shiftwidth". "tabstop" or "softtabstop" is used in other places.
<BS> will delete a "shiftwidth" worth of space at the start of the line.
]]
vim.o.smarttab = true

--[[
Number of spaces that a <Tab> count for while performing editing
operations, like inserting a <Tab> or using <BS>. It "feels" like
<Tab>s are being inserted, while in fact a mix of spaces an <Tab>s is
used.
]]
vim.o.softtabstop = 2

--[[
When on, splitting a window will put the new window below the current
one.
]]
vim.o.splitbelow = true

--[[
When on, splitting a window will put the new window right of the
current one.
]]
vim.o.splitright = true


--[[
Use a swapfile for the buffer.  This option can be reset when a
swapfile is not wanted for a specific buffer.  For example, with
confidential information that even root must not be able to access.
]]
vim.o.swapfile = false

--[[
Number of spaces that a <Tab> in the file counts for.  Also see
the :retab command, and the 'softtabstop' option.
]]
vim.o.tabstop = 2

--[[
Enables 24-bit RGB color in the TUI.  Uses "gui" :highlight
attributes instead of "cterm" attributes. guifg
Requires an ISO-8613-3 compatible terminal.
]]
vim.o.termguicolors = true

--[[
Maximum width of text that is being inserted.  A longer line will be
broken after white space to get this width.  A zero value disables
this.
When 'textwidth' is zero, 'wrapmargin' may be used.  See also
'formatoptions' and ins-textwidth.
When 'formatexpr' is set it will be used to break the line.
]]
vim.o.textwidth = 75

--[[
This option and 'timeoutlen' determine the behavior when part of a
mapped key sequence has been received. For example, if <c-f> is
pressed and 'timeout' is set, Nvim will wait 'timeoutlen' milliseconds
for any key that can follow <c-f> in a mapping.
]]
vim.o.timeout = true

--[[
Time in milliseconds to wait for a mapped sequence to complete.
default: 1000
]]
vim.o.timeoutlen = 300

--[[
When on, the title of the window will be set to the value of
'titlestring' (if it is not empty), or to:
  filename [+=-] (path) - NVIM
]]
vim.o.title = true

--[[
If this many milliseconds nothing is typed the swap file will be
written to disk (see crash-recovery).  Also used for the
CursorHold autocommand event.
]]
vim.o.updatetime = 300

--[[
Completion mode that is used for the character specified with
'wildchar'.  It is a comma-separated list of up to four parts.  Each
part specifies what to do for each consecutive use of 'wildchar'.  The
first part specifies the behavior for the first use of 'wildchar',
The second part for the second use, etc.
]]
vim.o.wildmode = "longest:full,full"

--[[
This option changes how text is displayed.  It doesn't change the text
in the buffer, see 'textwidth' for that.
When on, lines longer than the width of the window will wrap and
displaying continues on the next line.  When off lines will not wrap
and only part of long lines will be displayed.  When the cursor is
moved to a part that is not shown, the screen will scroll
horizontally.
The line will be broken in the middle of a word if necessary.  See
'linebreak' to get the break at a word boundary.
]]
vim.o.wrap = false

--[[
Number of characters from the right window border where wrapping
starts.  When typing text beyond this limit, an <EOL> will be inserted
and inserting continues on the next line.
Options that add a margin, such as 'number' and 'foldcolumn', cause
the text width to be further reduced.
When 'textwidth' is non-zero, this option is not used.
See also 'formatoptions' and ins-textwidth.
]]
vim.o.wrapmargin = 75

vim.o.spell = true
vim.o.spelllang = "de,en_us"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
