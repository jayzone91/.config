local map = function(mode, key, func, desc)
  return vim.keymap.set(mode, key, func, { desc = desc })
end

-- better up/down
vim.keymap.set(
  { "n", "x" },
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)
vim.keymap.set(
  { "n", "x" },
  "<Down>",
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)
vim.keymap.set(
  { "n", "x" },
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)
vim.keymap.set(
  { "n", "x" },
  "<Up>",
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set(
  "n",
  "<C-h>",
  "<C-w>h",
  { desc = "Go to left window", remap = true }
)
vim.keymap.set(
  "n",
  "<C-Left>",
  "<C-w>h",
  { desc = "Go to left window", remap = true }
)
vim.keymap.set(
  "n",
  "<C-j>",
  "<C-w>j",
  { desc = "Go to lower window", remap = true }
)
vim.keymap.set(
  "n",
  "<C-Down>",
  "<C-w>j",
  { desc = "Go to lower window", remap = true }
)
vim.keymap.set(
  "n",
  "<C-k>",
  "<C-w>k",
  { desc = "Go to upper window", remap = true }
)
vim.keymap.set(
  "n",
  "<C-Up>",
  "<C-w>k",
  { desc = "Go to upper window", remap = true }
)
vim.keymap.set(
  "n",
  "<C-l>",
  "<C-w>l",
  { desc = "Go to right window", remap = true }
)
vim.keymap.set(
  "n",
  "<C-Right>",
  "<C-w>l",
  { desc = "Go to right window", remap = true }
)

-- MacOnly Cause CTRL is mapped to another function
if vim.fn.has("macunix") then
  map("n", "<leader><right>", "<C-w>l", "Go to right window")
  map("n", "<leader><left>", "<C-w>h", "Go to left window")
end

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", "Move down")
map("n", "<A-Down>", "<cmd>m .+1<cr>==", "Move down")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", "Move down")
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", "Move down")
map("v", "<A-j>", ":m '>+1<cr>gv=gv", "Move down")
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", "Move down")

map("n", "<A-k>", "<cmd>m .-2<cr>==", "Move up")
map("n", "<A-Up>", "<cmd>m .-2<cr>==", "Move up")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", "Move up")
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", "Move up")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", "Move up")
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", "Move up")

-- Duplicate Line
map("n", "<leader><Up>", "YP", "Duplicate Line Up")
map("n", "<leader><Down>", "Yp", "Duplicate Line Down")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch")

map("t", "<esc>", "<C-\\><C-N>", "Leave Terminal Mode")
map("n", "<leader>ss", "<cmd>vsplit<cr>", "[S]plit [S]creen")
map("n", "te", "<cmd>tabedit<cr>", "New Tab")
map("n", "<leader>sw", "<cmd>tabclose<cr>", "Close Active Tab")
map("n", "<Tab>", "<cmd>tabnext<cr>", "Next Tab")
map("n", "<S-Tab>", "<cmd>tabprev<cr>", "Prev Tab")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set(
  "n",
  "n",
  "'Nn'[v:searchforward]",
  { expr = true, desc = "Next search result" }
)
vim.keymap.set(
  "x",
  "n",
  "'Nn'[v:searchforward]",
  { expr = true, desc = "Next search result" }
)
vim.keymap.set(
  "o",
  "n",
  "'Nn'[v:searchforward]",
  { expr = true, desc = "Next search result" }
)
vim.keymap.set(
  "n",
  "N",
  "'nN'[v:searchforward]",
  { expr = true, desc = "Prev search result" }
)
vim.keymap.set(
  "x",
  "N",
  "'nN'[v:searchforward]",
  { expr = true, desc = "Prev search result" }
)
vim.keymap.set(
  "o",
  "N",
  "'nN'[v:searchforward]",
  { expr = true, desc = "Prev search result" }
)

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save file")

map("n", "<leader>qq", "<cmd>qa<CR>", "Quit Vim")

map("n", "+", "<C-a>", "Increment")
map("n", "-", "<C-x>", "Decrement")
map("n", "dw", 'vb"_d', "Delete Word backwards")
