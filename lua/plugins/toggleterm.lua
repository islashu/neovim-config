return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      -- This is how you can conform the the lua setup way of adding options and possibly changing keymaps
      require("toggleterm").setup({
        open_mapping = [[<F12>]],
        direction = "horizontal",
        size = 30,
      })
    end,
  },
}
