return {
  "folke/flash.nvim",
  config = function()
    require("flash").setup({
      labels = "1234567890",
    })
  end,
}
