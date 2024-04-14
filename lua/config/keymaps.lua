-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<Esc>")

-- Unable to put keymappings in bufferline file for some reason, I believe that it was loading its own lazyVim config folder and not the one in /plugins
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
-- focus on same window after opening a buffer
vim.keymap.set("n", "<A-4>", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<F4>", ":BufferLineCloseOthers<CR>")
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

-- Toggle term
-- How to easily jump between tabs of terminal and neotree and bufferline
-- diable ctrl + / -> to start the terminal
-- Add split window for multiple terminals
vim.keymap.set("n", "<C-/>", "<Nop>")
