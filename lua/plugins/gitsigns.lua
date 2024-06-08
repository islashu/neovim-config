return {
  -- (Plugin definition)
  -- This is the plugin definition for gitsigns which are the symbols
  -- and signs that are shown in the gutter of the buffer. You can also undo the changes
  -- of a specific line, each of these lines are called hunks. You can reset them
  -- or cycle through them using this plugin.
  "lewis6991/gitsigns.nvim",
  config = function()
    -- setup gitsigns
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signcolumn = true, -- (default)
      numhl = false, -- highlight the line number if git change
      linehl = false, -- highlights the entire line if git change
      word_diff = false, -- highlight word if git change
      watch_gitdir = {
        follow_files = true,
      },
      current_line_blame = true, -- Line_blame is the git commit info for a specific line
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      current_line_blame_formatter_opts = {
        relative_time = false,
      },
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 2000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      -- When gitsign is loaded/attached to a buffer, the following keymaps are set
      on_attach = function(buffer)
        -- uncomment to see that when attaching to a buffer, the following message is printed
        -- print("Gitsigns attached to buffer " .. buffer)

        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
      -- stylua: ignore start
      map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
      map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
      map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
      map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    })
    -- setup gitsigns with the scrollbar, this is required as per the plugin instructions and
    -- cannot be set up directly in the nvim scroll bar function
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
