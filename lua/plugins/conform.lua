return {
  "stevearc/conform.nvim",
  -- This is a configurer for formatters and linters all in one place, does not do any formatting, you will need to install the formatters and linters yourself
  -- e.g. prettier
  -- For prettier to work, you will need to globally npm install prettier or locally
  -- as of right now locally work with @prettier/plugin-php, globally, the path could not find the right path an always give the unable to find package error in conform.log
  --
  -- tldr:
  -- 1. npm install --save-dev prettier @prettier/plugin-php
  -- 2. add node_modules -> gitignore and the package.json file to your project if not js project
  -- 3. add the formatters_by_ft to the opts function
  -- 4. create a .prettierrc file in the root of your project (does not matter if there are my projects, just make sure it is in the root of the project)
  -- 5. Do not download prettier extension via lazyvim overrides the @prettier/plugin-php, @ goes to the nearest prettier plugin
  --
  -- e.g of .prettierrc
  -- {
  --     "plugins": ["@prettier/plugin-php"],
  --     "tabWidth": 4,
  --     "braceStyle": "1tbs",
  --     "printWidth": 500, #how long the line should be before it wraps
  -- }
  --
  --
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "prettier" },
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
      formatters = {
        prettier = {
          --global prettier configs
        },
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
  keys = { { "<leader>cf", "<cmd>Format<cr>", desc = "Format" } },
}
