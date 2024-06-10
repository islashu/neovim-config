# 💤 LazyVim

## What features does this configuration have?

This is based on the LazyVim distro by nfejzic, with some amazing modifications. If you need help with keymaps.
you can search up lazyVim. Note that there is a difference between LazyVim and lazy.nvim. LazyVim is a distro, while lazy.nvim is a plugin. A distro is just a collections of plugins and configurations on top of the base neovim configuration.

The main features are:
- LSPs for multiple languages for auto-completion, linting, formatting, code actions, and more
- Mason for installing linters, formatters, and other lsp servers
- CMP for auto-completion, with snippets support
- Treesitter, for syntax highlighting, marks functions and variables
- Telescope, for finding files across entire project with fzf
- Git integration with lazygit, a condensed UI to perform all the necessary git commands without the need to remember the git commands
- Gitsigns, git lense and git code changes
- Global refactoring with incremental renaming, similar to intellij
- Extraction of methods and variable with primeage refactoring
- Global search for words similar using ripgrep, similar to intellij
- Blazingly fast cursor jumping with leap an flash
- Blazingly fast instant wrapping of words using nvim surround
- Blazingly fast vim motions
- Remap any keymaps without conflicts unlike VSCode or intellij
- Custom Autocommands for easy auto execution
- Custom macros
- File explorer support with neo-tree
- Autobrackets and colouring with rainbow delimiter
- Recent files search with frecency
- Tmux support navigation
- Colour show in hex code
- TODOs with colouring
- dashboard with nice ascii art
- Tab support using bufferline
- Copilot support



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

