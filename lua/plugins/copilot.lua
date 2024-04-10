return {
  "zbirenbaum/copilot.lua",
  -- Disabling these features as copilot-cmp will take over, I have added these many properties despite disabling them because
  -- it is easier to manage in the future if i decide not to use copilot-cmp.lua
  -- If you want any configuration of copilot-cmp, go to autocomplete/copilot-cmp
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 25,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },

  copilot_node_command = "node", -- Node.js version must be > 18.x
  server_opts_overrides = {},
}
