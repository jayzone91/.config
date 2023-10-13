return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false },
    { "folke/neodev.nvim",  opts = {} },

    -- Autocomplete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",

    --Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    -- LSP Loading Animation
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      event = "LspAttach",
      opts = {}
    }
  }
}
