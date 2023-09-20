return {
  "Vigemus/iron.nvim",
  keys = {
    { "<leader>ir", vim.cmd.IronRepl, desc = "󱠤 Toggle REPL" },
    { "<leader>iR", vim.cmd.IronRestart, desc = "󱠤 Restart REPL" },
    { "<leader>is", mode = { "n", "x" }, desc = "󱠤 Send-to-REPL Operator" },
    { "<leader>iS", desc = "󱠤 Send Line to REPL" }
  },
  main = "iron.core",
  opts = {
    keymaps = {
      send_line = "<leader>iS",
      visual_send = "<leader>is",
      send_motion = "<leader>is",
    },
    config = {
      repl_open_cmd = "horizontal bot 10 split",
      repl_definition = {
        python = {
          command = function()
            local iPythonAvailable = vim.fn.executable("ipython") == 1
            local binary = iPythonAvailable and "iphython" or "python3"
            return { binary }
          end,
        }
      }
    }
  }
}
