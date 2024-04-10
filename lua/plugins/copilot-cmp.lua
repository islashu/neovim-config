return {
  -- return { } is the same as require(<name of plugin>).setup({ <include code and properties here> })
  -- as per instruction of this plugin, I will need to disable the autocomplete in copilot.lua and active it here
  "zbirenbaum/copilot-cmp",
  event = { "InsertEnter", "LspAttach" },
  fix_pairs = true,
}
