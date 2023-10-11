------------
--- INIT ---
------------

local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Set Leader Key first, then load Plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------
--- BASE CONFIG ---
-------------------
vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true
vim.o.background = "dark"
vim.o.backspace = "indent,eol,start"
vim.o.backup = false
if vim.fn.has("macunix") == 1 then
  vim.opt.clipboard:append({ "unnamedplus" })
end
if vim.fn.has("win32") == 1 then
  vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end
vim.o.cmdheight = 1
vim.o.colorcolumn = "75"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 3
vim.o.cursorline = true
vim.o.emoji = true
vim.o.expandtab = true
vim.o.fileencoding = "UTF-8"
vim.o.foldclose = ""
vim.o.foldcolumn = "0"
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldminlines = 1
vim.o.formatoptions = "jcroqlnt"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.iskeyword = "@,48-57,_,192-255,-"
vim.o.laststatus = 0
vim.o.linebreak = true
vim.o.list = true
vim.o.mouse = "a"
vim.o.mousescroll = "ver:3,hor:6"
vim.o.number = true
vim.o.pumblend = 10
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.o.showcmd = true
vim.o.showmode = false
vim.o.sidescroll = 0
vim.o.sidescrolloff = 0
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.textwidth = 75
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.title = true
vim.o.updatetime = 300
vim.o.wildmode = "longest:full,full"
vim.o.wrap = false
vim.o.wrapmargin = 75
vim.o.spell = true
vim.o.spelllang = "de,en_us"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

------------
--- Lazy ---
------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  defaults = {
    lazy = true,
    version = false,
  },
  checker = { enable = true },
  spec = {
    {
      "goolord/alpha-nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      event = "VimEnter",
      opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
      ⠀⠀⠀⠀⣀⣀⣤⣤⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⡄⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠛⢿⣿⡇⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⣿⡟⠡⠂⠀⢹⣿⣿⣿⣿⣿⣿⡇⠘⠁⠀⠀⣿⡇⠀⢠⣄⠀⠀⠀⠀
      ⠀⠀⠀⠀⢸⣗⢴⣶⣷⣷⣿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣴⣿⣗⣄⣼⣷⣶⡄⠀⠀
      ⠀⠀⠀⢀⣾⣿⡅⠐⣶⣦⣶⠀⢰⣶⣴⣦⣦⣶⠴⠀⢠⣿⣿⣿⣿⣿⣿⡇⠀⠀
      ⠀⠀⢀⣾⣿⣿⣷⣬⡛⠷⣿⣿⣿⣿⣿⣿⣿⠿⠿⣠⣿⣿⣿⣿⣿⠿⠛⠀⠀⠀
      ⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣶⣦⣭⣭⣥⣭⣵⣶⣿⣿⣿⣿⡟⠉⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠙⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣛⠛⠛⠛⠛⠛⢛⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠿⣿⣿⣿⠿⠿⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⠿⠇⠀  ⠀⠀⠀⠀

        There is no place like ~/
    ]]

        dashboard.section.header.val = vim.split(logo, "\n")
        dashboard.section.buttons.val = {
          dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
          dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
          dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
          dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
          dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
          dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
          button.opts.hl = "AlphaButtons"
          button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout[1].val = 8
        return dashboard
      end,
      config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
          vim.cmd.close()
          vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
              require("lazy").show()
            end,
          })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
          pattern = "LazyVimStarted",
          callback = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
            pcall(vim.cmd.AlphaRedraw)
          end,
        })
      end,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
    },
    "f3fora/cmp-spell",
    {
      "numToStr/Comment.nvim",
      opts = {},
      lazy = false,
    },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      event = "LspAttach",
      opts = {},
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
        { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end,   desc = "Flash" },
        { "r", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
        {
          "<c-s>",
          mode = { "c" },
          function() require("flash").toggle() end,
          desc =
          "Toggle Flash Search"
        },
      },
    },
    "dinhhuy258/git.nvim",
    "lewis6991/gitsigns.nvim",
    {
      "ThePrimeagen/harpoon",
      dependencies = "nvim-lua/plenary.nvim",
      opts = {},
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      event = { "BufReadPost", "BufNewFile" },
      opts = {
      }
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
        "catppuccin/nvim"
      },
    },
    {
      "iamcco/markdown-preview.nvim",
      event = "BufRead",
      build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
      "folke/noice.nvim",
      opts = {},
      dependencies = {
        "MunifTanjim/nui.nvim",
        {
          "rcarriga/nvim-notify",
        },
      },
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {},
    },
    {
      "NvChad/nvim-colorizer.lua",
      opts = {},
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-calc",
        "saadparwaiz1/cmp_luasnip",
        {
          "L3MON4D3/LuaSnip",
          build = (not jit.os:find("Windows"))
              and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
              or nil,
          opts = { history = true, delete_check_events = "TextChanged", },
        },
        { "folke/neoconf.nvim", cmd = "Neoconf", config = false, },
        { "folke/neodev.nvim",  opts = {} },
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      config = function()
        local _augroups = {}
        local get_augroup = function(client)
          if not _augroups[client.id] then
            local group_name = "kickstart-lsp-format-" .. client.name
            local id = vim.api.nvim_create_augroup(group_name, { clear = true })
            _augroups[client.id] = id
          end
          return _augroups[client.id]
        end
        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("kickstart-lsp-attach-format", { clear = true }),
          callback = function(args)
            local client_id = args.data.client_id
            local client = vim.lsp.get_client_by_id(client_id)
            local bufnr = args.buf
            if client == nil then return end
            if not client.server_capabilities.documentFormattingProvider then
              return
            end
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = get_augroup(client),
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format {
                  async = false,
                  filter = function(c)
                    return c.id == client.id
                  end,
                }
              end,
            })
          end,
        })
      end,
      opts = {
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
          },
          severity_sort = true,
        },
        inlay_hints = { enabled = true },
        capabilities = {},
        autoformat = true,
        format_notify = false,
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        }
      }
    },
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      },
    },
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = { "nvim-lua/plenary.nvim",
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = "make",
          cond = function()
            return vim.fn.executable "make" == 1
          end,
        },
      },
      opts = function(_, opts)
        local function flash(prompt_bufnr)
          require("flash").jump({
            pattern = "^",
            label = { after = { 0, 0 } },
            search = {
              mode = "search",
              exclude = {
                function(win)
                  return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
                end,
              },
            },
            action = function(match)
              local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
              picker:set_selection(match.pos[1] - 1)
            end,
          })
        end
        opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
          mappings = { n = { s = flash }, i = { ["<c-f>"] = flash }, }
        })
      end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      opts = {},
      cmd = { "TodoTrouble", "TodoTelescope" },
      event = { "BufReadPost", "BufNewFile" },
      config = true,
      keys = {
        {
          "]t",
          function() require("todo-comments").jump_next() end,
          desc = "Next todo comment"
        },
        {
          "[t",
          function() require("todo-comments").jump_prev() end,
          desc = "Previous todo comment"
        },
        {
          "<leader>xt",
          "<cmd>TodoTrouble<cr>",
          desc = "Todo (Trouble)"
        },
        {
          "<leader>xT",
          "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
          desc = "Todo/Fix/Fixme (Trouble)"
        },
        {
          "<leader>st",
          "<cmd>TodoTelescope<cr>",
          desc = "Todo"
        },
        {
          "<leader>sT",
          "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
          desc = "Todo/Fix/Fixme"
        },
      }
    },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      opts = {},
    },
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = { use_diagnostic_signs = true },
      cmd = { "TroubleToggle", "Trouble" },
      keys = {
        { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
        { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
        { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
        {
          "[q",
          function()
            if require("trouble").is_open() then
              require("trouble").previous({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cprev)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Previous trouble/quickfix item",
        },
        {
          "]q",
          function()
            if require("trouble").is_open() then
              require("trouble").next({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cnext)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Next trouble/quickfix item",
        },
      }
    },
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
      end,
      opts = {
        key_labels = {
          ["<space>"] = "Space",
          ["<cr>"] = "Return",
          ["<tab>"] = "Tab",
          ["<Down>"] = "",
          ["<Left>"] = "",
          ["<Up>"] = "",
          ["<Right>"] = "",
          ["<esc>"] = "ESC",
          ["<bs>"] = "Backspace",
        }
      },
    },
    {
      "folke/zen-mode.nvim",
      opts = {},
    }
  },
}, {})

--------------
--- CONFIG ---
--------------

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "eslint",
    "tsserver",
    "taplo",
    "rust_analyzer",
    "marksman",
    "prismals",
    "clangd",
    "emmet_ls",
    "sqlls",
    "cssls",
  },
  automatic_installation = true,
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require("lspconfig")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
local fmt = require("luasnip.extras.fmt").fmt
local snippet = luasnip.snippet
local insert_node = luasnip.insert_node
local function_node = luasnip.function_node
local dynamic_node = luasnip.dynamic_node
local snippet_node = luasnip.snipped_node
local rep = require("luasnip.extras").rep


luasnip.config.setup({})
require("neodev").setup()
local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.buf.inlay_hint(bufnr, true)
  end
end
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        checkThirdParty = false
      },
      telemetry = { enable = false },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
})
lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    codeActionsOnSave = {
      enabel = true,
      mode = "all",
    },
  },
})
lspconfig.tsserver.setup({})
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach
})
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
})
lspconfig.marksman.setup({})
lspconfig.prismals.setup({})
lspconfig.clangd.setup({})
lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
    "typescript",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})
lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.sqlls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
local cmp = require("cmp")
local defaults = require("cmp.config.default")
cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "npm" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "calc" },
    {
      name = "spell",
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      }
    }
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.locality,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.offset,
      cmp.config.compare.sort_text,
      cmp.config.compare.order,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    }),
  },
  experimental = {
    ghost_text = true,
  },
  performance = {
    max_view_entries = 100,
  },
})
require("catppuccin").setup({
  transparent_background = true,
  term_colors = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    fidget = true,
    harpoon = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    mason = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
      inlay_hints = {
        background = true,
      },
    },
    telescope = {
      enabled = true,
    },
    lsp_trouble = true,
    which_key = true,
  }
})
vim.cmd.colorscheme("catppuccin")
require("git").setup({
  default_mappings = true,
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Open file/folder in git repository
    browse = "<Leader>go",
    -- Open pull request of the current branch
    open_pull_request = "<Leader>gp",
    -- Create a pull request with the target branch is set in the `target_branch` option
    create_pull_request = "<Leader>gn",
    -- Opens a new diff that compares against the current index
    diff = "<Leader>gd",
    -- Close git diff
    diff_close = "<Leader>gD",
    -- Revert to the specific commit
    revert = "<Leader>gr",
    -- Revert the current file to the specific commit
    revert_file = "<Leader>gR",
  },
  -- Default target branch when create a pull request
  target_branch = "master",
  -- Private gitlab hosts, if you use a private gitlab, put your private gitlab host here
  private_gitlabs = { "https://xxx.git.com" }

})
require("gitsigns").setup({
  signs                        = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true
  },
  attach_to_untracked          = true,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm                         = {
    enable = false
  },
})
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#e5c07b" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61afef" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#d19a66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98c379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#c678dd" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56b6c2" })
end)

require("ibl").setup({
  indent = {
    highlight = highlight,
  },
}
)
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin"
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
})
require("notify").setup({
  background_colour = "#000000",
  fps = 30,
  render = "compact",
  timeout = 2500,
})
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
  },
})
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30
  },
  renderer = {
    group_empty = true,
    root_folder_label = false,
    highlight_git = true,
    highlight_opened_files = "none",
    indent_markers = {
      enable = false
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    }
  },
  filters = {
    dotfiles = false
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  git = {
    enable = true,
  },
  filesystem_watchers = {
    enable = true,
  },
})
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30
  },
  renderer = {
    group_empty = true,
    root_folder_label = false,
    highlight_git = true,
    highlight_opened_files = "none",
    indent_markers = {
      enable = false
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    }
  },
  filters = {
    dotfiles = false
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  git = {
    enable = true,
  },
  filesystem_watchers = {
    enable = true,
  },
})

require("telescope").setup({
  defaults               = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
  },
  file_sorter            = require("telescope.sorters").get_fuzzy_file,
  file_ignore_pattern    = { "node_modules" },
  generic_sorter         = require("telescope.sorters").get_generic_fuzzy_sorter,
  path_display           = { "truncate" },
  winblend               = 0,
  border                 = {},
  borderchars            = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  color_devicons         = true,
  set_env                = { ["COLORTERM"] = "truecolor" },
  file_previewer         = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer         = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer       = require("telescope.previewers").vim_buffer_qflist.new,
  buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  mappings               = {
    n = { ["q"] = require("telescope.actions").close },
  },
  extensions_list        = { "themes", "terms" },
}
)

pcall(require("telescope").load_extension, "fzf")
require("telescope").load_extension("harpoon")
require("toggleterm").setup()
require("which-key").register({
  ["<leader>"] = {
    f = {
      name = "+file||format"
    },
    c = {
      name = "+Code Actions"
    },
    g = {
      name = "+git"
    },
    p = {
      name = "+project"
    },
    q = {
      name = "DANGERZONE"
    },
    x = {
      name = "Trouble"
    },
    z = {
      name = "Zen"
    },
    s = {
      name = "+screen"
    },
    h = {
      name = "+harpoon"
    },
    d = {
      name = "+DAP"
    },
    t = {
      name = "+Types"
    },
    m = {
      name = "+Markdown"
    },
    l = {
      name = "+Legendary Find"
    },
    i = {
      name = "+Iron DAP"
    }
  }
})

-----------------
--- Auto CMDS ---
-----------------

local function augroup(name)
  return vim.api.nvim_create_augroup("jaynvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd(
  { "FocusGained", "TermClose", "TermLeave" },
  {
    group = augroup("checktime"),
    command = "checktime"
  }
)

vim.api.nvim_create_autocmd(
  "TextYankPost",
  {
    group = augroup("highlight_yank"),
    callback = function()
      vim.highlight.on_yank()
    end
  }
)

vim.api.nvim_create_autocmd(
  "VimResized",
  {
    group = augroup("resize_split"),
    callback = function()
      local current_tab = vim.fn.tabpagenr()
      vim.cmd("tabdo wincmd =")
      vim.cmd("tabnext " .. current_tab)
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = augroup("close_with_q"),
    pattern = {
      "PlenaryTestPopup",
      "help",
      "lspinfo",
      "Legendary",
      "man",
      "qf",
      "spectre_panel",
      "startuptime",
      "neotest-output",
      "checkhealth",
      "neotest-summary",
      "neotest-output-panel",
    },
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", "<cmd>close<cr>",
        { buffer = event.buf, silent = true })
    end,
  })

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = augroup("python_typos"),
    pattern = "python",
    callback = function()
      vim.cmd.inoreabbrev("<buffer> true True")
      vim.cmd.inoreabbrev("<buffer> false False")
      vim.cmd.inoreabbrev("<buffer> // #")
      vim.cmd.inoreabbrev("<buffer> -- #")
      vim.cmd.inoreabbrev("<buffer> null None")
      vim.cmd.inoreabbrev("<buffer> nil None")
      vim.cmd.inoreabbrev("<buffer> none None")
    end
  })

----------------
--- Mappings ---
----------------



map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save File")
map("n", "<C-c>", "<Esc><CR>", "")
map("n", "<C-a>", "gg<S-v>G", "Select all")
map("n", "<leader>qq", "<cmd>qa<CR>", "Quit Vim")
map('n', '+', '<C-a>', "")
map('n', '-', '<C-x>', "")
map('n', 'dw', 'vb"_d', "")
map("n", "<leader>cs", "<cmd>nohl<CR>", "[C]lear [S]earchresults")
map("n", "<A-Up>", "<cmd>m -2<CR>", "Move Text Up one Line")
map("n", "<A-Down>", "<cmd>m +1<CR>", "Move Text Down one Line")
map("n", "<leader><Up>", "YP", "Duplicate Line Up")
map("n", "<leader><Down>", "Yp", "Duplicate Line Down")
map(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  "Escape and clear hlsearch")
map("t", "<esc>", "<C-\\><C-N>", "Leave Terminal Mode")
map("n", "<leader>ss", "<cmd>vsplit<cr>", "[S]plit [S]creen")
map("n", "<c-down>", "<cmd>wincmd j<cr>", "Move to lower Window")
map("n", "<c-up>", "<cmd>wincmd k<cr>", "Move to upper Window")
map("n", "<c-left>", "<cmd>wincmd h<cr>", "Move to left Window")
map("n", "<leader><left>", "<cmd>wincmd h<cr>", "Move to left Window")
map("n", "<c-right>", "<cmd>wincmd l<cr>", "Move to right Window")
map("n", "<leader><right>", "<cmd>wincmd l<cr>", "Move to right Window")
map("n", "<leader>sq", "<cmd>close<cr>", "Close Window")
map("n", "<leader>st", "<cmd>tabnew<cr>", "New Tab")
map("n", "<leader>sw", "<cmd>tabclose<cr>", "Close Active Tab")
map("n", "<Tab>", "<cmd>tabnext<cr>", "Next Tab")
map("n", "<S-Tab>", "<cmd>tabprev<cr>", "Prev Tab")
map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("n", "K", vim.lsp.buf.hover, "Somethin Hover")
map("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
map("n", "rn", vim.lsp.buf.rename, "Rename")
map(
  { "n", "v" },
  "<leader>ca",
  vim.lsp.buf.code_action,
  "[C]ode [A]ctions")
map("n", "gr", vim.lsp.buf.references, "[G]oto [R]eferences")
map(
  "n",
  "<leader>pv",
  "<cmd>NvimTreeToggle<cr>",
  "Open Filebrowser")
local trouble = require("trouble")
map("n", "<leader>xx", function() trouble.open() end, "Open Trouble")
map(
  "n",
  "<leader>xw",
  function()
    trouble.open("workspace_diagnostics")
  end,
  "Open Workspace Diag")
map(
  "n",
  "<leader>xd",
  function()
    trouble.open("document_diagnostics")
  end,
  "Open Document Diag")
map(
  "n",
  "<leader>xq",
  function()
    trouble.open("quickfix")
  end,
  "Open Quickfix Window")
map(
  "n",
  "<leader>xl",
  function()
    trouble.open("loclist")
  end,
  "Open loclist")
map(
  "n",
  "gR",
  function()
    trouble.open("lsp_references")
  end,
  "Open LSP Reference")
local troubleProvider = require("trouble.providers.telescope")
map(
  "n",
  "<leader>xt",
  troubleProvider.open_with_trouble,
  "Open with Trouble")
local telescopeBuiltin = require("telescope.builtin")
map("n", "<leader>ff", telescopeBuiltin.find_files, "Find Files")
map("n", "<leader>fg", telescopeBuiltin.live_grep, "Live Grep")
map("n", "<leader>fo", telescopeBuiltin.oldfiles, "Recently opened Files")
map("n", "<leader><space>", telescopeBuiltin.buffers, "Show Buffer")
map("n", "<leader>fb",
  function()
    telescopeBuiltin.current_buffer_fuzzy_find(
      require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
  end,
  "Search Current Buffer")
map("n", "<leader>zz",
  function() require("zen-mode").toggle({ window = { width = .85 } }) end,
  "Toggle Zen Mode")
map(
  "n",
  "<leader>ha",
  function()
    require("harpoon.mark").add_file()
  end,
  "Add File")
map(
  "n",
  "<leader>ht",
  function()
    require("harpoon.ui").toggle_quick_menu()
  end,
  "Toggle Menu")
map(
  "n",
  "<leader>hn",
  function()
    require("harpoon.ui").nav_next()
  end,
  "Navigate to Next entry")
map(
  "n",
  "<leader>hp",
  function()
    require("harpoon.ui").nav_prev()
  end,
  "Navigate to Prev entry")
map(
  "n",
  "<leader>hc",
  function()
    require("harpoon.mark").clear_all()
  end,
  "Clear All Entries")
map(
  "n",
  "<leader>mp",
  "<cmd>MarkdownPreviewToggle<cr>",
  "Markdown Preview")
map(
  "n",
  "<leader>tth",
  "<cmd>ToggleTerm direction=horizontal<cr>",
  "Toggle Terminal Horizontal")

map(
  "n",
  "<leader>ttv",
  "<cmd>ToggleTerm direction=vertical size=40<cr>",
  "Toggle Termimal Vertical")
