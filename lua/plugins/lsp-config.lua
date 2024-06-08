return {
  -- (Plugin definition)
  -- LSP-zero is a plugin that allows you to setup LSP servers with ease. It is a wrapper
  -- on top of the different dependencies below. Normally you will need to set up all the lsp
  -- servers somewhat manually, you can see the amount of code that is needed to set up the lua
  -- servers in lazyVim. This plugin does this automatically for you.
  --
  -- There are a lot of things to note here, just have autocomplete and detections of errors
  -- and warnings. The logic is handled by lsp, which are downloaded through mason. Mason just
  -- does the downloading. You still need to attach the lsp to the buffer(buffer is a complex way or saying
  -- the file that you are currently editing). This is done by mason-lspconfig. Mason-lspconfig
  -- has a function called setup which will attach the lsp to the buffer by checking its filetype.
  -- nvim-lspconfig is the plugin that has the configuration for the lsp servers but now you can do
  -- this through lsp-zero. Displaying the information as autocomplete through cmp which is another plugin
  -- it is a UI for autocomplete. This UI also takes in informtion from different sources like snippets
  -- lsp for autocomplete, text suggestions, copilot etc.
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    {
      "neovim/nvim-lspconfig", -- For attaching LSP to the buffer
    },
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
      build = ":MasonUpdate",
    }, -- For installing LSP, linters, formatters
    {
      "williamboman/mason-lspconfig.nvim", -- Prepares lsp with necessary configuration before attachment to the buffer
    },
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    require("mason").setup({})
    require("mason-lspconfig").setup({
      handlers = {

        ----------- Automatically setup LSP servers using nvim-lspconfig once downloaded using Mason ------------
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ----------- Automatically setup LSP servers once downloaded using Mason ------------

        ----------- Custom configuration of each server here, copy and paste ------------

        -- diagnosticls LSP
        diagnosticls = function()
          local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
          local diagnostic_cfg = {
            enable = true,
            underline = true,
            float = {
              -- focusable = false,
              -- style = "minimal",
              source = "always",
            },
            signs = {
              text = {
                [vim.diagnostic.severity.ERROR] = signs.Error,
                [vim.diagnostic.severity.WARN] = signs.Warn,
                [vim.diagnostic.severity.HINT] = signs.Hint,
                [vim.diagnostic.severity.INFO] = signs.Info,
              },
              texthl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticDefault",
                [vim.diagnostic.severity.WARN] = "DiagnosticDefault",
                [vim.diagnostic.severity.HINT] = "DiagnosticDefault",
                [vim.diagnostic.severity.INFO] = "DiagnosticDefault",
              },
              numhl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticDefault",
                [vim.diagnostic.severity.WARN] = "DiagnosticDefault",
                [vim.diagnostic.severity.HINT] = "DiagnosticDefault",
                [vim.diagnostic.severity.INFO] = "DiagnosticDefault",
              },
              severity_sort = true,
            },
          }
          vim.diagnostic.config(diagnostic_cfg)
          require("lspconfig").diagnosticls.setup({})
        end,

        -- Lua LSP
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls({
            -- custom opts for lua_opts here
            on_attach = function(client, bufnr) end,
          })
          require("lspconfig").lua_ls.setup(lua_opts)
        end,

        tsserver = function()
          require("lspconfig").tsserver.setup({
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = false

              local ts_utils = require("nvim-lsp-ts-utils")
              ts_utils.setup({})
              ts_utils.setup_client(client)
            end,
          })
        end,

        ----------- Custom configuration of each server here, copy and paste ------------
      },
    })
  end,
}
