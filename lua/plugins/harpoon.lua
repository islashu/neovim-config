return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- USE telescope UI for harpoon
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    -- Keymaps
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      vim.notify = require("notify")
      vim.notify("File Added!", "info", {
        title = "Harpoon",
        timeout = 2000,
      })
    end)
    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<C-1>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-2>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-3>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-4>", function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-k>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-j>", function()
      harpoon:list():next()
    end)
  end,
}
