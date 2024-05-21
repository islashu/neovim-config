-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<Esc>")

-- (Explanation) Create highlight groups to change copilot ghost text
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#a0eb96" })

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

-- Trying to remove terminal
vim.keymap.set("n", "<c-/>", "<Nop>")
vim.keymap.del("n", "<c-/>")

-- Toggle term
vim.keymap.set("n", "<C-/>", "<cmd>close<cr>")
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })


-- Custom function to delete current buffer
vim.api.nvim_create_user_command("BufferLineDeleteCurrent",
  function()
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
  end
  , { range = true })
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineDeleteCurrent<cr>", { desc = "Delete Current Buffer" })

vim.keymap.set("n", "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD <CR>")

-- https://stackoverflow.com/questions/18020381/vim-search-and-replace-using-current-line-as-reference-point
-- For  replacing from current line onwards
vim.keymap.set("v", "<leader>rc",'"hy:.,$s/<C-r>h//gc<left><left><left>')

-- For replacing the entire file at one go
vim.keymap.set("v", "<leader>rf",'"hy:.,%s/<C-r>h//g<left><left>')

-- For replacing words in all opened files/buffers, amazing for replacing multiples files at once
vim.keymap.set("v", "<leader>rb",'hy:bufdo %s/<C-r>h//g<left><left>')

vim.keymap.set("v", "<A-j>", "}")
vim.keymap.set("v", "<A-k>", "{")

