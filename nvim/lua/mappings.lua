----------------
--- Mappings ---
----------------

local map = vim.keymap.set

-- Base Mappings
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<C-c>", "<Esc><CR>")
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit Vim" })
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')
map('n', 'dw', 'vb"_d')
map("n", "<leader>cs", "<cmd>nohl<CR>", { desc = "[C]lear [S]earchresults" })
map("n", "<A-Up>", "<cmd>m -2<CR>", { desc = "Move Text Up one Line" })
map("n", "<A-Down>", "<cmd>m +1<CR>", { desc = "Move Text Down one Line" })
map("n", "<leader><Up>", "YP", { desc = "Duplicate Line Up" })
map("n", "<leader><Down>", "Yp", { desc = "Duplicate Line Down" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("t", "<esc>", "<C-\\><C-N>", { desc = "Leave Terminal Mode" })

-- Window Management
map("n", "<leader>ss", "<cmd>vsplit<cr>", { desc = "[S]plit [S]creen" })
map("n", "<c-down>", "<cmd>wincmd j<cr>", { desc = "Move to lower Window" })
map("n", "<c-up>", "<cmd>wincmd k<cr>", { desc = "Move to upper Window" })
map("n", "<c-left>", "<cmd>wincmd h<cr>", { desc = "Move to left Window" })
map("n", "<c-right>", "<cmd>wincmd l<cr>", { desc = "Move to right Window" })
map("n", "<leader>sq", "<cmd>close<cr>", { desc = "Close Window" })
map("n", "<leader>st", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>sw", "<cmd>tabclose<cr>", { desc = "Close Active Tab" })
map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<S-Tab>", "<cmd>tabprev<cr>", { desc = "Prev Tab" })

-- LSP
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Somethin Hover" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
map("n", "rn", vim.lsp.buf.rename, { desc = "Rename" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
map("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })

map("n", "<leader>ts", "<cmd>setlocal spell spelllang=de<cr>", { desc = "Toggle Spellcheck DE" })

-- Plugin Mappings

-- nvim-tree
map("n",
  "<leader>pv",
  "<cmd>NvimTreeToggle<cr>",
  { desc = "Open Filebrowser" })



-- Trouble
local trouble = require("trouble")
map("n", "<leader>xx", function() trouble.open() end, { desc = "Open Trouble" })
map("n", "<leader>xw", function() trouble.open("workspace_diagnostics") end, { desc = "Open Workspace Diag" })
map("n", "<leader>xd", function() trouble.open("document_diagnostics") end, { desc = "Open Document Diag" })
map("n", "<leader>xq", function() trouble.open("quickfix") end, { desc = "Open Quickfix Window" })
map("n", "<leader>xl", function() trouble.open("loclist") end, { desc = "Open loclist" })
map("n", "gR", function() trouble.open("lsp_references") end, { desc = "Open LSP Reference" })
local troubleProvider = require("trouble.providers.telescope")
map("n", "<leader>xt", troubleProvider.open_with_trouble, { desc = "Open with Trouble" })

-- Telescope
local telescopeBuiltin = require("telescope.builtin")
map("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "Live Grep" })
map("n", "<leader>fo", telescopeBuiltin.oldfiles, { desc = "Recently opened Files" })
map("n", "<leader><space>", telescopeBuiltin.buffers, { desc = "Show Buffer" })
map("n", "<leader>fb",
  function()
    telescopeBuiltin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end,
  { desc = "Search Current Buffer" })

-- Zen Mode
map("n", "<leader>zz",
  function() require("zen-mode").toggle({ window = { width = .85 } }) end,
  { desc = "Toggle Zen Mode" })

-- Harpoon
map("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Add File" })
map("n", "<leader>ht", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Menu" })
map("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, { desc = "Navigate to Next entry" })
map("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, { desc = "Navigate to Prev entry" })
map("n", "<leader>hc", function() require("harpoon.mark").clear_all() end, { desc = "Clear All Entries" })

-- Markdown Preview
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

-- Legendary
map("n", "<leader>ls", "<cmd>Legendary<cr>", { desc = "Open Legendary" })
map("n", "<leader>lk", "<cmd>Legendary keymaps<cr>", { desc = "Search Keymaps" })
map("n", "<leader>lc", "<cmd>Legendary commands<cr>", { desc = "Search Commands" })
map("n", "<leader>lf", "<cmd>Legendary function<cr>", { desc = "Search Functions" })
map("n", "<leader>la", "<cmd>Legendary autocmds<cr>", { desc = "Search Autocmds" })

-- ToggleTerm
map("n", "<leader>tth", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal Horizontal" })
map("n", "<leader>ttv", "<cmd>ToggleTerm direction=vertical size=40<cr>", { desc = "Toggle Termimal Vertical" })
