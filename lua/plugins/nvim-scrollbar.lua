local colors = require("onedark.palette")["dark"]

return {
  "petertriho/nvim-scrollbar",
  dependencies = { "navarasu/onedark.nvim" },
  config = function()
    require("scrollbar").setup({
      handle = {
        color = colors.dark_cyan,
      },
      marks = {
        Cursor = {
          text = "",
          priority = 0,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil,
          highlight = "Normal",
        },
        Search = { color = colors.orange },
        Error = { color = colors.red },
        Warn = { color = colors.yellow },
        Info = { color = colors.cyan },
        Hint = { color = colors.purple },
        Misc = { color = colors.purple },
        GitChange = { color = colors.blue },
        GitAdd = { color = colors.green },
        GitDelete = { color = colors.bg0 },
      },
    })
  end,
}
