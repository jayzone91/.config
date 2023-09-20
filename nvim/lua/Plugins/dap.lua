local function signs(name, sign, thl)
  vim.fn.sign_define(name, { text = sign, texthl = thl, linehl = "", numhl = "" })
end

local map = function(mode, keys, func, desc)
  if desc then
    desc = "LSP: " .. desc
  end
  vim.keymap.set(mode, keys, func, { desc = desc })
end

local function arginp(prompt)
  return coroutine.create(function(dap_run_co)
    vim.ui.input({ prompt = prompt }, function(argstr)
      coroutine.resume(dap_run_co, argstr)
    end)
  end)
end

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      signs('DapBreakpoint', '', 'DiagnosticSignHint')
      signs('DapBreakpointCondition', '󰟃', 'DiagnosticSignWarn')
      signs('DapLogPoint', '󰸥', 'DiagnosticSignInfo')
      signs('DapBreakpointRejected', '󰅙', 'DiagnosticSignError')

      map("n", "<leader>dg", dap.continue, "DAP Forwards Continue")
      map("n", "<leader>dG", dap.reverse_continue, "DAP Reverse Continue")
      map("n", "<leader>df", dap.step_over, "DAP Step Over")
      map("n", "<leader>do", dap.step_out, "DAP Step Out")
      map("n", "<leader>di", function()
        dap.step_into({ askForTargets = true })
      end, "DAP Step Into")
      map("n", "<leader>db", dap.toggle_breakpoint, "DAP Toggle Breakpoint")
      map("n", "<leader>dC", dap.clear_breakpoints, "DAP Clear Breakpoints")
      map("n", "<leader>dS", dap.step_back, "DAP Step Back")
      map("n", "<leader>dB", function()
        dap.set_breakpoint(arginp("Condition: "))
      end, "DAP Set Conditional Breakpoint (input condition)")
      map("n", "<leader>dv", function()
        dap.set_breakpoint(arginp("Condition: "), arginp("Hits: "))
      end, "DAP Set Conditional Breakpoint (input condition)")
      map("n", "<leader>dV", function()
        dap.set_breakpoint(arginp("Condition: "), arginp("Hits: "), arginp("Log: "))
      end, "DAP Set Complete Conditional Breakpoint (input condition)")
      map("n", "<leader>dl", function()
        dap.set_breakpoint(nil, nil, arginp("Log: "))
      end, "DAP Set Log Breakpoint (input condition)")
      map("n", "<leader>de", function()
        dap.set_exeption_breakpoints(vim.fn.split(vim.fn.input("Exceptopn Types: "), " ", false))
      end, "DAP Set Exeption Breakpoint (input condition)")
      map("n", "<leader>dt", dap.terminate, "DAP Terminate")
      map("n", "<leader>dr", dap.repl.open, "DAP REPL Open")
    end
  }
}
