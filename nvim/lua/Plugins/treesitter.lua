return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = true,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
          init = function()
            require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
            load_textobjects = true
          end,
        },
      }
    },
    cmd = { "TsUpdateSync" },

  }
}
