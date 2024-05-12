return {
  "stevearc/conform.nvim",

  -- Conform is a wrapper for other formatter, what is does is that the real formatters are cmdline only,
  -- Conform converts your current commands that the cmdline formatters can understand and then they relay the changes back to the buffer
  -- we can decide what formatter to use for each filetype, if you want to install a specific formatter you can do it with the package manager
  -- using mason, just do :Mason then go to the formatter page and press i the change the value here to the name of the formatter that you want to use
  --
  -- in the case of prettier, unlike other formatters which only supports one language, prettier supports multiple languages, the one installed via mason
  -- only supports javascript, typescript, css, html, json, yaml, markdown, graphql, php, if you want to use prettier for other languages you need to install
  -- the plugins via npm, but the problem is that the plugins don't go to the correct directory and therefore cause error when trying to format the file
  -- on top of this, you will also need to add a prettierrc file.

  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        php = { "prettier" },
      },
    }
    return opts
  end,
  -- config = function()
  --   require("conform").setup({
  --     -- This is to add a <cmd>
  --     vim.api.nvim_create_user_command("Format", function(args)
  --       local range = nil
  --       if args.count ~= -1 then
  --         local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
  --         range = {
  --           start = { args.line1, 0 },
  --           ["end"] = { args.line2, end_line:len() },
  --         }
  --       end
  --       require("conform").format({ async = true, lsp_fallback = true, range = range })
  --     end, { range = true }),
  --   })
  -- end,
  -- keys = { { "<leader>cf", "<cmd>Format<cr>", desc = "Format" } },
  keys = { { "<leader>cf", require("conform").format(), desc = "Format" } },
}
