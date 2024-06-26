return {
  "kylechui/nvim-surround",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        insert = "'C-g's",
        insert_line = "xC-gcS",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        -- Note that c in insert mode might be slowed down due to this plugin, will be slightly delayed
        change = "xs",
        change_line = "cS",
      },
    })
  end,
}
