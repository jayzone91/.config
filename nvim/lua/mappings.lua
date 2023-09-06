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

-- Window Management
map("n", "<leader>ss", "<cmd>vsplit<cr>", { desc = "[S]plit [S]creen" })
map("n", "<leader>sq", "<cmd>close<cr>", { desc = "Close Window" })
map("n", "<leader>st", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>sw", "<cmd>tabclose<cr>", { desc = "Close Active Tab" })
map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<S-Tab>", "<cmd>tabprev<cr>", { desc = "Prev Tab" })


map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("t", "<esc>", "<C-\\><C-N>", { desc = "Leave Terminal Mode" })

-- Format with prettier.
map("n", "<leader>fp", ":%!npx prettier --stdin-filepath %<cr>:w<cr>", { desc = "Format File with Prettier" })

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

-- Harpoon
map("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Add File" })
map("n", "<leader>ht", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Menu" })
map("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, { desc = "Navigate to Next entry" })
map("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, { desc = "Navigate to Prev entry" })
map("n", "<leader>hc", function() require("harpoon.mark").clear_all() end, { desc = "Clear All Entries" })
