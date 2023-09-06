return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    lazy = true,
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "T", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" }
    }
  }
}
