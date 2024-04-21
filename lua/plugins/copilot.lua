-- return {
--   "zbirenbaum/copilot.lua",
--   enabled = true,
--   dependencies = {
--     "hrsh7th/nvim-cmp",
--   },
--   cmd = "Copilot",
--   build = ":Copilot auth",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({
--       panel = {
--         enabled = true,
--         auto_refresh = true,
--       },
--       suggestion = {
--         enabled = true,
--         -- use the built-in keymapping for "accept" (<M-l>)
--         auto_trigger = true,
--         accept = false, -- disable built-in keymapping
--       },
--     })
--
--     -- hide copilot suggestions when cmp menu is open
--     -- to prevent odd behavior/garbled up suggestions
--     local cmp_status_ok, cmp = pcall(require, "cmp")
--     if cmp_status_ok then
--       cmp.event:on("menu_opened", function()
--         vim.b.copilot_suggestion_hidden = true
--       end)
--
--       cmp.event:on("menu_closed", function()
--         vim.b.copilot_suggestion_hidden = false
--       end)
--     end
--   end,
-- }

return {
  "zbirenbaum/copilot.lua",
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<Mq-j>",
          accept_line = "<M-l>",
          accept_word = "<M-k>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-c>",
        },
      },
    },
  },
  -- -- Disabling these features as copilot-cmp will take over, I have added these many properties despite disabling them because
  -- -- it is easier to manage in the future if i decide not to use copilot-cmp.lua
  -- -- If you want any configuration of copilot-cmp, go to autocomplete/copilot-cmp
  -- panel = {
  --   enabled = false,
  --   auto_refresh = false,
  --   keymap = {
  --     jump_prev = "[[",
  --     jump_next = "]]",
  --     accept = "<CR>",
  --     refresh = "gr",
  --     open = "<M-CR>",
  --   },
  --   layout = {
  --     position = "bottom", -- | top | left | right
  --     ratio = 0.4,
  --   },
  -- },
  -- suggestion = {
  --   enabled = true,
  --   auto_trigger = true,
  --   debounce = 25,
  --   keymap = {
  --     accept = "<Tab>",
  --     accept_word = false,
  --     accept_line = false,
  --     next = "<M-]>",
  --     prev = "<M-[>",
  --     dismiss = "<C-]>",
  --   },
  -- },
  -- filetypes = {
  --   yaml = false,
  --   markdown = false,
  --   help = false,
  --   gitcommit = false,
  --   gitrebase = false,
  --   hgcommit = false,
  --   svn = false,
  --   cvs = false,
  --   ["."] = false,
  -- },
  --
  -- copilot_node_command = "node", -- Node.js version must be > 18.x
  -- server_opts_overrides = {},
}
