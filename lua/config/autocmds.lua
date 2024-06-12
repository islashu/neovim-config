-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "php",
--   callback = function()
--     vim.opt.tabstop = 4
--     vim.opt.shiftwidth = 4
--     vim.opt.expandtab = true
--     vim.bo.softtabstop = 4
--   end,
-- })

-- Autocommand auto run on event "filetype"
-- If the filtype is lua, execute the callback function
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.bo.softtabstop = 2
  end,
})

-- Autocommand auto run on event "filetype"
-- If the filtype is js, execute the callback function
vim.api.nvim_create_autocmd("FileType", {
  pattern = "js",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.bo.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.bo.softtabstop = 4
  end,
})


-- Custom function
-- Custom command line function, run :BufferLineDeleteCurrent on the cmdline within neovim
-- You can extend the capabilities of this by assigning it to a vim.keymap
vim.api.nvim_create_user_command("BufferLineDeleteCurrent", function()
  local current = vim.fn.bufnr("%")
  local buflist = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buf in ipairs(buflist) do
    if buf.bufnr == current then
      -- close neo tree
      vim.cmd([[Neotree close]])
      vim.cmd("bdelete " .. buf.bufnr)
      return
    end
  end
end, { range = true })

vim.api.nvim_create_user_command("SetupLintersAndFormatters", function()
  vim.notify = require("notify")
  local filesDestination = vim.loop.cwd()
  -- Copy and paste file to the root of the project
  local filesSource = "~/.config/nvim/libconfigs/."
  local command = "cp -r " .. filesSource .. " " .. filesDestination
  vim.notify("Copying linter and formatter config files to the root of the project...", "info")
  vim.cmd("term " .. command .. " && exit")
  vim.notify(
    "The configs files have been added to the root of the project. Please ensure that the formatters/linters have been downloaded via Mason or via npm for prettier + necessary plugins",
    "warn",
    {
      title = "Setup Linters and Formatters",
      timeout = 10000,
      render = "wrapped-compact",
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    }
  )
end, { range = true })

require("conform").setup({
  -- This is to add a <cmd>
  vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    require("conform").format({ async = true, lsp_fallback = true, range = range })
  end, { range = true }),
})
