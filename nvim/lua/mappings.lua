----------------
--- Mappings ---
----------------

local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Base Mappings
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save File")
map("n", "<C-c>", "<Esc><CR>", "")
map("n", "<C-a>", "gg<S-v>G", "Select all")
map("n", "<leader>qq", "<cmd>qa<CR>", "Quit Vim")
map('n', '+', '<C-a>', "")
map('n', '-', '<C-x>', "")
map('n', 'dw', 'vb"_d', "")
map("n", "<leader>cs", "<cmd>nohl<CR>", "[C]lear [S]earchresults")
map("n", "<A-Up>", "<cmd>m -2<CR>", "Move Text Up one Line")
map("n", "<A-Down>", "<cmd>m +1<CR>", "Move Text Down one Line")
map("n", "<leader><Up>", "YP", "Duplicate Line Up")
map("n", "<leader><Down>", "Yp", "Duplicate Line Down")
map(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  "Escape and clear hlsearch")
map("t", "<esc>", "<C-\\><C-N>", "Leave Terminal Mode")

-- Window Management
map("n", "<leader>ss", "<cmd>vsplit<cr>", "[S]plit [S]creen")
map("n", "<c-down>", "<cmd>wincmd j<cr>", "Move to lower Window")
map("n", "<c-up>", "<cmd>wincmd k<cr>", "Move to upper Window")
map("n", "<c-left>", "<cmd>wincmd h<cr>", "Move to left Window")
map("n", "<c-right>", "<cmd>wincmd l<cr>", "Move to right Window")
map("n", "<leader>sq", "<cmd>close<cr>", "Close Window")
map("n", "<leader>st", "<cmd>tabnew<cr>", "New Tab")
map("n", "<leader>sw", "<cmd>tabclose<cr>", "Close Active Tab")
map("n", "<Tab>", "<cmd>tabnext<cr>", "Next Tab")
map("n", "<S-Tab>", "<cmd>tabprev<cr>", "Prev Tab")

-- LSP
map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("n", "K", vim.lsp.buf.hover, "Somethin Hover")
map("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
map("n", "rn", vim.lsp.buf.rename, "Rename")
map(
  { "n", "v" },
  "<leader>ca",
  vim.lsp.buf.code_action,
  "[C]ode [A]ctions")
map("n", "gr", vim.lsp.buf.references, "[G]oto [R]eferences")

map(
  "n",
  "<leader>ts",
  "<cmd>setlocal spell spelllang=de<cr>",
  "Toggle Spellcheck DE")

-- Plugin Mappings

-- nvim-tree
map("n",
  "<leader>pv",
  "<cmd>NvimTreeToggle<cr>",
  "Open Filebrowser")



-- Trouble
local trouble = require("trouble")
map("n", "<leader>xx", function() trouble.open() end, "Open Trouble")
map(
  "n",
  "<leader>xw",
  function()
    trouble.open("workspace_diagnostics")
  end,
  "Open Workspace Diag")
map(
  "n",
  "<leader>xd",
  function()
    trouble.open("document_diagnostics")
  end,
  "Open Document Diag")
map(
  "n",
  "<leader>xq",
  function()
    trouble.open("quickfix")
  end,
  "Open Quickfix Window")
map(
  "n",
  "<leader>xl",
  function()
    trouble.open("loclist")
  end,
  "Open loclist")
map(
  "n",
  "gR",
  function()
    trouble.open("lsp_references")
  end,
  "Open LSP Reference")
local troubleProvider = require("trouble.providers.telescope")
map(
  "n",
  "<leader>xt",
  troubleProvider.open_with_trouble,
  "Open with Trouble")

-- Telescope
local telescopeBuiltin = require("telescope.builtin")
map("n", "<leader>ff", telescopeBuiltin.find_files, "Find Files")
map("n", "<leader>fg", telescopeBuiltin.live_grep, "Live Grep")
map("n", "<leader>fo", telescopeBuiltin.oldfiles, "Recently opened Files")
map("n", "<leader><space>", telescopeBuiltin.buffers, "Show Buffer")
map("n", "<leader>fb",
  function()
    telescopeBuiltin.current_buffer_fuzzy_find(
      require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
  end,
  "Search Current Buffer")

-- Zen Mode
map("n", "<leader>zz",
  function() require("zen-mode").toggle({ window = { width = .85 } }) end,
  "Toggle Zen Mode")

-- Harpoon
map(
  "n",
  "<leader>ha",
  function()
    require("harpoon.mark").add_file()
  end,
  "Add File")
map(
  "n",
  "<leader>ht",
  function()
    require("harpoon.ui").toggle_quick_menu()
  end,
  "Toggle Menu")
map(
  "n",
  "<leader>hn",
  function()
    require("harpoon.ui").nav_next()
  end,
  "Navigate to Next entry")
map(
  "n",
  "<leader>hp",
  function()
    require("harpoon.ui").nav_prev()
  end,
  "Navigate to Prev entry")
map(
  "n",
  "<leader>hc",
  function()
    require("harpoon.mark").clear_all()
  end,
  "Clear All Entries")

-- Markdown Preview
map(
  "n",
  "<leader>mp",
  "<cmd>MarkdownPreviewToggle<cr>",
  "Markdown Preview")

-- Legendary
map("n", "<leader>ls", "<cmd>Legendary<cr>", "Open Legendary")
map("n", "<leader>lk", "<cmd>Legendary keymaps<cr>", "Search Keymaps")
map("n", "<leader>lc", "<cmd>Legendary commands<cr>", "Search Commands")
map("n", "<leader>lf", "<cmd>Legendary function<cr>", "Search Functions")
map("n", "<leader>la", "<cmd>Legendary autocmds<cr>", "Search Autocmds")

-- ToggleTerm
map(
  "n",
  "<leader>tth",
  "<cmd>ToggleTerm direction=horizontal<cr>",
  "Toggle Terminal Horizontal")
map(
  "n",
  "<leader>ttv",
  "<cmd>ToggleTerm direction=vertical size=40<cr>",
  "Toggle Termimal Vertical")
