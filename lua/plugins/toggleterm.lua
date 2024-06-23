return {
  "akinsho/toggleterm.nvim",
  opts = {},
  config = function()
    require("toggleterm").setup({
      -- Basic configuration
      open_mapping = [[<c-t>]],
      direction = "vertical",
      size = 40,

      -- keymap to run python file in terminal
      vim.keymap.set("n", "<leader>rr", function()
        local current_file_uri = vim.api.nvim_buf_get_name(0)
        -- clear
        require("toggleterm").exec("clear")
        -- run python file in terminal

        require("toggleterm").exec("python3" .. " " .. current_file_uri)
      end, { desc = "Run command in terminal" }),
    })
  end,
}
