-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<Esc>")

vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
-- focus on same window after opening a buffer
vim.keymap.set("n", "<A-d>l", ":BufferLineCloseRight")
vim.keymap.set("n", "<A-d>h", ":BufferLineCloseLeft")
-- insert a delete left bufferline
-- splitting window

-- Set up github copilot, cosnippet need some improvement
-- Allow the selection of copilolt suggestion using tabs
-- Set up for colours
--disabled
vim.keymap.set("n", "<C-z>", "<Nop>")
--To learn
-- select and replace multiple occurrence
-- understand how to insert keys within their individual lua files for opts
-- disable lua
-- able to search across the entire project for a specific line
