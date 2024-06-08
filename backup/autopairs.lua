return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      fast_wrap = {
        map = "<S-w>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        before_key = "h",
        after_key = "l",
        cursor_pos_before = true,
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        manual_position = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })
  end,
}
