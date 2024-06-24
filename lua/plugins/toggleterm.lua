return {
  "akinsho/toggleterm.nvim",
  opts = {},
  config = function()
    require("toggleterm").setup({
      -- Basic configuration
      open_mapping = [[<c-t>]],
      direction = "vertical",
      size = 50,

      -- keymap to run python file in terminal
      vim.keymap.set("n", "<leader>tt", function()
        local current_file_uri = vim.api.nvim_buf_get_name(0)
        -- get file type
        local file_type = vim.api.nvim_buf_get_option(0, "filetype")
        -- clear
        if file_type == "python" then
          require("toggleterm").exec("clear")
          -- run python file in terminal
          require("toggleterm").exec("python3" .. " " .. current_file_uri)
        end
      end, { desc = "Run file in terminal" }),
    })
  end,
}
