# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

How autocommands work
How the plugin lua files works
How to add a new plugin
How to add a new keybinding
How to add a new autocommand
Understanding the format of the lua files in the plugin folder
How you can pass opts argument after config function
How to declare a new config function
How Lsp works
How to add a new Lsp server
How to download linters, how to configure them
How to disable plugins
what is bufRead bufWrite events

Manually configuring the plugins:
 -- These plugins do not have auto installation to attachment procedure,
 -- Installing them in Mason does not auto attach the linter/formatter to the buffer
 -- After installing using Mason, you will have to go into the plugin folder and 
 -- specifically assign the linter/formatter to the filetype, alternatively you can
 -- just use from the preconfig that I already added to multiple different common filetypes
 --

linters
formatters


-- Custom Lua configurations 
https://github.com/nfejzic/config/blob/main/nvim/lua/user/lsp.lua

