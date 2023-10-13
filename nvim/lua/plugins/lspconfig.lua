return {
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
    "rafamadriz/friendly-snippets",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
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
      timeout_ms = nil
    }
  },
  config = function()
    -- Mason
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "eslint",
        "tsserver",
        "rust_analyzer",
        "marksman",
        "prismals",
        "clangd",
        "sqlls",
        "cssls"
      },
      automatic_installation = true,
    })

    local _augroups = {}
    local get_augroup = function(client)
      if not _augroups[client.name] then
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
      end
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
    require("luasnip").config.setup({})

    require("neodev").setup()

    local on_attach = function(client, bufnr)
      if client.server.capabilities.inlayHintProvider then
        vim.lsp.buf.inlay_hint(bufnr, true)
      end
    end

    -- LSP

    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          completion = { callSnippet = "Replace" },
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            checkThirdParty = false
          },
          telemetry = { enable = false }
        }
      },
      capabilities = capabilities,
      on_attach = on_attach
    })

    require("lspconfig").tsserver.setup({})
    require("lspconfig").rust_analyzer.setup({
      settings = {
        ["rust_analyzer"] = { diagnostics = { enable = true } }
      }
    })
    require("lspconfig").marksman.setup({})
    require("lspconfig").prismals.setup({})
    require("lspconfig").clangd.setup({})
    require("lspconfig").cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach
    })
    require("lspconfig").sqlls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })


    -- CMP
    require("cmp").setup({
      completion = { completeopt = "menu,menuone,noinsert" },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = require("cmp").mapping.preset.insert({
        ['<C-u>'] = require("cmp").mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = require("cmp").mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = require("cmp").mapping.complete(),
        ['<CR>'] = require("cmp").mapping.confirm {
          behavior = require("cmp").ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").select_prev_item()
          elseif require("lausnip").jumpable(-1) then
            require("luasnip").jump(-1)
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
          require("cmp").config.compare.exact,
          require("cmp").config.compare.locality,
          require("cmp").config.compare.score,
          require("cmp").config.compare.recently_used,
          require("cmp").config.compare.offset,
          require("cmp").config.compare.sort_text,
          require("cmp").config.compare.order,
        },
      },
      confirm_opts = {
        behavior = require("cmp").ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = require("cmp").config.window.bordered({
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        }),
        documentation = require("cmp").config.window.bordered({
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

    -- Mappings
    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = desc })
    end

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
      "<leader>ts",
      "<cmd>setlocal spell spelllang=de<cr>",
      "Toggle Spellcheck DE")
  end,
}
