return {
  "folke/flash.nvim",
  config = function()
    require("flash").setup({
      labels = "abcdefghijklmnopqrstuvwxyz",
    })
  end,
}
