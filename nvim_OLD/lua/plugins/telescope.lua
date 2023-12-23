return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "LukasPietzschmann/telescope-tabs",
      config = function()
        require("telescope-tabs").setup()
      end,
    },
    {
      "piersolenski/telescope-import.nvim",
    },
    {
      "benfowler/telescope-luasnip.nvim",
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
          grouped = true,
        },
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        import = {
          insert_at_top = true,
          custom_languages = {
            {
              regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
              filetypes = {
                "typescript",
                "typescriptreact",
                "javascript",
                "react",
              },
              extensions = { "js", "ts" },
            },
          },
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("telescope-tabs")
    require("telescope").load_extension("import")
    require("telescope").load_extension("luasnip")

    local builtin = require("telescope.builtin")

    local map = function(mode, key, func, desc)
      return vim.keymap.set(mode, key, func, { desc = desc })
    end
    map("n", "<leader>ff", builtin.find_files, "Find Files")
    map("n", "<leader>fg", builtin.live_grep, "Live Grep")
    map("n", "<leader><space>", builtin.buffers, "Buffers")
    map(
      "n",
      "<leader>fb",
      builtin.current_buffer_fuzzy_find,
      "Search current Buffer"
    )
    map("n", "<leader>e", function()
      require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
        grouped = true,
        hidden = true,
        no_ignore = false,
        respect_gitignore = false,
        previewer = true,
        initial_mode = "normal",
        layout_config = { height = 40 },
        select_buffer = true,
      })
    end, "Open File Explorer")
    map("n", "<leader>ft", function()
      require("telescope-tabs").list_tabs()
    end, "List Tabs")
    map("n", "<leader>fi", "<cmd>Telescope import<cr>", "Show Imports")
    map("n", "<leader>fs", "<cmd>Telescope luasnip<cr>", "Show Snippets")
  end,
}
