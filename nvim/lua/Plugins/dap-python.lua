return {
  "mfussenegger/nvim-dap-python",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local debugpyPath = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python3"
    require("dap-python").setup(debugpy, {})
  end
}
