return {
  "hrsh7th/cmp-cmdline",
  config = function()
    local cmp = require("cmp")
    cmp.setup.cmdline(":", {
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<A-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<A-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      },
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
  end,
}
