-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.bo.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.bo.softtabstop = 2
  end,
})
