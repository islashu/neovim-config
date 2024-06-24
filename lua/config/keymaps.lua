-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here:
-- For autocompletion keymaps, see cmp.lua to assign keymaps
--
-- These are global keymaps that can be overwritten by the plugin keymaps that you
-- define in the plugin folder. Plugin folders takes precedence over this file.
-- This file is loaded first and then the plugin folders are loaded.
-- Another thing is that if you find that the keymaps in the plugin folder is not working
-- it is likely that an key define is faulty. So try defining the keymap in this file first
-- and see if it works

-- Set keymaps for terminal mode to allow for easy navigation with hjkl
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.keymap.set("i", "jj", "<Esc>")

-- (Explanation) Create highlight groups to change copilot ghost text
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#a0eb96" })
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })

--BufferLine config, certain bufferline mappings cannot be done here and can be found in the plugin folders
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<S-l>", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader>td", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>ta", ":BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<leader>te", ":BufferLineCloseAllButCurrent<CR>")
vim.keymap.set("n", "<leader>tr", ":BufferLine")
vim.keymap.set("n", "<A-n>", ":m +1<CR>")
vim.keymap.set("n", "<A-m>", ":m -2<CR>")

vim.keymap.set("n", "<A-j>", "}")
vim.keymap.set("n", "<A-k>", "{")
-- Allow for pasting of last copied value even after performing delete
vim.keymap.set("n", "<s-p>", '"0p')
vim.keymap.set("n", "<C-z>", "<Nop>")

vim.keymap.set("n", "<leader>4", "<cmd>BufferLineDeleteCurrent<cr>", { desc = "Delete Current Buffer" })
vim.keymap.set("n", "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD <CR>")

-- https://stackoverflow.com/questions/18020381/vim-search-and-replace-using-current-line-as-reference-point
-- For  replacing from current line onwards
vim.keymap.set("v", "<leader>rr", '"hy:.,$s/<C-r>h//gc<left><left><left>', { desc = "Rename variable with confirmation" })

-- For replacing the entire file at one go
vim.keymap.set("v", "<leader>rf", '"hy:.,%s/<C-r>h//g<left><left>', { desc = "Rename variable in file" })

-- For replacing words in all opened files/buffers, amazing for replacing multiples files at once
vim.keymap.set("v", "<leader>rb", "hy:bufdo %s/<C-r>h//g<left><left>", { desc = "Rename variable in all opened buffers"})

vim.keymap.set("v", "<A-j>", "}")
vim.keymap.set("v", "<A-k>", "{")

vim.keymap.set("n", "[", "<C-o>")
vim.keymap.set("n", "]", "<C-i>")

-- Trying to remove terminal
vim.keymap.del("n", "<c-/>")
vim.keymap.del("t", "<c-/>")
