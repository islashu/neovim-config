return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    --Specify that linting will only occur for current buffer
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },

    --Specify the linters that will be used for each filetype
    -- 1. Download linters using Mason
    -- 2. Some linters require additional prerequisites to work
    --    a. eslint requires a .eslintrc file in the root of the project
    --    b. phpcs requires the phpcs package to be installed
    linters_by_ft = {
      -- Add new linters here
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      php = { "phpcs" }, -- Please run sudo apt install php-xmlwriter
    },
    linters = {},
  },
  config = function(_, opts)
    local M = {}

    ----------- Linters custom functions for auto linting based on filetype, Not necessary to understand -----------
    local lint = require("lint")
    for name, linter in pairs(opts.linters) do
      if type(linter) == "table" and type(lint.linters[name]) == "table" then
        lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
        if type(linter.prepend_args) == "table" then
          vim.list_extend(lint.linters[name].args, linter.prepend_args)
        end
      else
        lint.linters[name] = linter
      end
    end
    lint.linters_by_ft = opts.linters_by_ft

    function M.debounce(ms, fn)
      local timer = vim.uv.new_timer()
      return function(...)
        local argv = { ... }
        timer:start(ms, 0, function()
          timer:stop()
          vim.schedule_wrap(fn)(unpack(argv))
        end)
      end
    end

    function M.lint()
      -- Use nvim-lint's logic first:
      -- * checks if linters exist for the full filetype first
      -- * otherwise will split filetype by "." and add all those linters
      -- * this differs from conform.nvim which only uses the first filetype that has a formatter
      vim.notify = require("notify")
      local names = lint._resolve_linter_by_ft(vim.bo.filetype)

      -- Create a copy of the names table to avoid modifying the original.
      names = vim.list_extend({}, names)

      -- Add fallback linters.
      if #names == 0 then
        vim.list_extend(names, lint.linters_by_ft["_"] or {})
      end

      -- Add global linters.
      vim.list_extend(names, lint.linters_by_ft["*"] or {})

      -- Filter out linters that don't exist or don't match the condition.
      local ctx = { filename = vim.api.nvim_buf_get_name(0) }
      ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
      names = vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        if not linter then
          LazyVim.warn("Linter not found: " .. name, { title = "nvim-lint" })
        end
        return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
      end, names)

      -- Run linters.
      if #names > 0 then
        vim.notify("Running Linter: " .. table.concat(names, ", "))
        lint.try_lint(names)
      end
    end
    ----------- Linters custom functions, Not necessary to understand -----------

    -- This autocmd will run the M.lint function on the BufReadPost or BufWritePost event is triggered
    -- In other words, it will run the linter when a file is opened or saved
    -- using nvim_create_autocmd api to set when it is triggered
    -- first parameter is the event that triggers the autocmd
    -- second parameter is a table with the group and callback (meaning that the callback func will run when the event is triggered)
    -- vim.api.nvim_create_autocmd(opts.events, {
    --   group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
    --   callback = M.debounce(100, M.lint),
    -- })

    vim.keymap.set("n", "<leader>cl", function()
      M.lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
