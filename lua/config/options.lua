-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options her
--
--

-- controls if formatters are run on save
vim.g.autoformat = false
vim.opt.list = false
-- (Explanation) Set the clipboard to use the system clipboard for copy and paste
vim.opt.clipboard = "unnamedplus"
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.g.lsp_zero_extend_lspconfig = 0
vim.opt.scrolloff = 5
vim.opt.smarttab = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
