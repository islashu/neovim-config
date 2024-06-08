local colors = require("tokyonight.colors").setup()

return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Cursor = {
          text = "",
          priority = 0,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "Normal",
        },
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
        GitChange = { color = colors.orange },
        GitAdd = { color = colors.green1 },
        GitDelete = { color = colors.red1 },
      },
    })
  end,
}
