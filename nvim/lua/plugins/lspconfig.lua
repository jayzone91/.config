--lspconfig

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim",  opts = {} },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
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
      timeout_ms = nil,
    }

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
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
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
        "emmet_ls",
        "sqlls",
        "cssls",
      },
      automatic_installation = true,
    })
    local lspconfig = require("lspconfig")
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
  end,
}
