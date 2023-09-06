return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = true,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      }
    },
    cmd = { "TsUpdateSync" },

  }
}
