-- [[
-- which-key helps you remember key bindings
-- by showing a popup with the active
-- keybindings of the command you started typing.
-- ]]

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>w"] = { name = "+windows" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
