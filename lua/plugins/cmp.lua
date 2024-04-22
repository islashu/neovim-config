return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer", -- Buffer Completions
    "hrsh7th/cmp-path", -- Path Completions
    "saadparwaiz1/cmp_luasnip", -- Snippet Completions
    "hrsh7th/cmp-nvim-lsp", -- LSP Completions
    "hrsh7th/cmp-nvim-lua", -- Lua Completions
    "hrsh7th/cmp-cmdline", -- CommandLine Completions
    "L3MON4D3/LuaSnip", -- Snippet Engine
    "rafamadriz/friendly-snippets", -- Bunch of Snippets
    {
      "windwp/nvim-autopairs",
      config = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
          check_ts = true, -- treesitter integration
          disable_filetype = { "TelescopePrompt" },
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
          return
        end
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    cmp.mapping.confirm({ select = false })

    require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/snipmate" })
    require("luasnip.loaders.from_vscode").lazy_load()
    -- require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/vscode" }

    local kind_icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Copilot = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }

    -- Custom functions --
    local function format_ghost_text(entry, vim_item)
      -- Check if the source is Co-pilot
      if entry.source.name == "co-pilot" then
        vim_item.menu = "[Co-pilot]"
      end
      return vim_item
    end

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      -- adjust this to time it takes for cmp to show up
      -- performance = {
      --   debounce = 500,
      -- },

      sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,

          -- Below is the default comparitor list and order for nvim-cmp
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        ["<A-j>"] = cmp.mapping.select_next_item(),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),

        -- (Ben) select = false, prevents automatic selections of the first item when pressing enter, the idea is that you want to only select something if you highlight it
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false })),

        -- Modified the tab key to allow for copilot to be used, no longer necessary
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   local copilot = require("copilot.suggestion")
        --   if copilot.is_visible() then
        --     copilot.accept()
        --     cmp.confirm()
        --   elseif cmp.visible() then
        --     local entry = cmp.get_selected_entry()
        --     if not entry then
        --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        --       -- cmp.confirm()
        --     else
        --       cmp.confirm()
        --     end
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }),
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
          return vim_item
        end,
      },

      -- (Explanation) Selecting menuone automtically selects the first item in the cmp which usually means that if you want to press enter you skip to the next line, you will end up
      -- selecting the first item in the cmp, which is not what you want
      -- completion = {
      --   -- Select the very first item in cmp automatically
      --   completeopt = "menu,menuone,noinsert",
      --   timeout = 500,
      -- },

      -- (Explanation) indicate here the different options that appear in the autocomplete menu
      -- Other Sources
      sources = {
        {
          name = "copilot",
        },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "neorg" },
        -- { name = "cmdline" },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      view = {
        entries = {
          name = "custom",
          selection_order = "top_down",
        },
        docs = {
          auto_open = false,
        },
      },
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
          col_offset = -3,
          side_padding = 1,
          scrollbar = false,
          scrolloff = 8,
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
        },
      },

      -- This shows the grey text when you are typing like copilot but this should be set to false as it will show the ghost text for all sources and interfere with the copilot ghost text
      experimental = {
        -- (Explanation) This assign the text color to the ghost text, you can declare the color in the highlight group in keymaps.lua
        -- ghost_text = { hl_group = "CopilotSuggestion" },
        ghost_text = false,
      },
    })
  end,
}
