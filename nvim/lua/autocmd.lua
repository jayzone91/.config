---------------------
--- Auto Commands ---
---------------------

local function augroup(name)
  return vim.api.nvim_create_augroup("jayvim_" .. name, { clear = true })
end

-- Check if we need ti reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime"
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  {
    group = augroup("highlight_yank"),
    callback = function()
      vim.highlight.on_yank()
    end
  })

-- resize window if window got resized
vim.api.nvim_create_autocmd("VimResized",
  {
    group = augroup("resize_split"),
    callback = function()
      local current_tab = vim.fn.tabpagenr()
      vim.cmd("tabdo wincmd =")
      vim.cmd("tabnext " .. current_tab)
    end
  })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "Legendary",
    "man",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keynao.set(
      "n",
      "q",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true })
  end,
})
