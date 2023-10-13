return { {


  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {}
  },
},
  "nvim-treesitter/playground"

}
