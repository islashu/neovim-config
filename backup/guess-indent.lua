return {
  -- The reason why we need this plugin is that the indenting support of the treesitters may not always work
  -- which means that we need a plugin that can autoindent properly without the support of treesitters
  --
  -- This works hand in hand with the formatter as we only run the formatter at the end but during coding
  -- we still want to achieve decent formatting when we enter a new line etc.
  -- This helps instead of running the formatter every line we write
  --
  "nmac427/guess-indent.nvim",
  config = function()
    require("guess-indent").setup({
      auto_cmd = true, -- Set to false to disable automatic execution
      override_editorconfig = false, -- Set to true to override settings set by .editorconfig
      filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
        "netrw",
        "tutor",
      },
      buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
        "help",
        "nofile",
        "terminal",
        "prompt",
      },
    })
  end,
}
