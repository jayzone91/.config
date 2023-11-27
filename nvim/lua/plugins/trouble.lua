return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    position = "top",
    height = 20,
  },
  config = function()
    local trouble = require("trouble")
    vim.keymap.set("n", "<leader>xx", function()
      trouble.toggle()
    end, { desc = "Toggle Trouble" })
    vim.keymap.set("n", "<leader>xq", function()
      trouble.toggle("quickfix")
    end, { desc = "Toggle Quickfix" })
    vim.keymap.set("n", "<leader>xl", function()
      trouble.toggle("lsp_reference")
    end, { desc = "Toggle LSP Ref" })
    vim.keymap.set("n", "<leader>xw", function()
      trouble.toggle("workspace_diagnostics")
    end, { desc = "Toggle Workspace Diag" })
    vim.keymap.set("n", "<leader>xd", function()
      trouble.toggle("document_diagnostics")
    end, { desc = "Toggle Document Diag" })
  end,
}
