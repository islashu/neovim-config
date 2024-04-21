-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<Esc>")

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#a0eb96" })

-- Unable to put keymappin gs in bufferline file for some reason, I believe that it was loading its own lazyVim config folder and not the one in /plugins
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
-- focus on same window after opening a buffer
vim.keymap.set("n", "<A-4>", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<F4>", ":BufferLineCloseOthers<CR>")
-- insert a delete left bufferline
-- splitting window
vim.keymap.set("n", "<A-j>", "<Nop>")
vim.keymap.set("n", "<A-k>", "<Nop>")
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

vim.keymap.set("n", "<s-p>", '"0p')
vim.keymap.set("n", "<c-/>", "<Nop>")

vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<leader>ft")
-- Toggle term
-- How to easil jump between tabs of terminal and neotree andbufferline
-- diable ctrl + / -> to start the terminal
-- Add split window for multiple terminals
vim.keymap.set("n", "<C-/>", "<cmd>close<cr>")
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
