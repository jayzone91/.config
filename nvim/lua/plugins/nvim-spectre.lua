-- search/replace in multiple files

return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- stylue: ignore
  keys = {
    {
      "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)"
    },
  },
}
