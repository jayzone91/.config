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

-- LSP
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Somethin Hover" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
map("n", "rn", vim.lsp.buf.rename, { desc = "Rename" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
map("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })


-- Telescope
local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Live Grep" })
map("n", "<leader><space>", telescope.buffers, { desc = "Show Buffer" })

-- Nvim Tree
map("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>", { desc = "Open Filebrowser" })


-- Trouble
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Somethin Hover" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
map("n", "rn", vim.lsp.buf.rename, { desc = "Rename" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
map("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })


-- Telescope
local telescopeBuiltin = require("telescope.builtin")
map("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "Live Grep" })
map("n", "<leader><space>", telescopeBuiltin.buffers, { desc = "Show Buffer" })

-- Nvim Tree
map("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>", { desc = "Open Filebrowser" })

-- Trouble
map("n", "<leader>xx", function() require("trouble").open() end, { desc = "Open Trouble" })

-- Zen Mode
map("n", "<leader>zz",
  function() require("zen-mode").toggle({ window = { width = .85 } }) end,
  { desc = "Toggle Zen Mode" })
map("n", "<leader>xx", function() require("trouble").open() end, { desc = "Open Trouble" })

-- Zen Mode
map("n", "<leader>zz",
  function() require("zen-mode").toggle({ window = { width = .85 } }) end,
  { desc = "Toggle Zen Mode" })
