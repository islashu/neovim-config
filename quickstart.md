git clone this config to get access to the neovim

but for certain plugins to work properly, you will need to install the following:

sudo apt install the following:
1. ripgrep -> allows searching for specific text in files
2. fzf -> fuzzy finder to search find files and directories when using telescope
3. tmux -> terminal multiplexer (read tmux.md)

Other plugins should be automatically installed by lazy.

# If you want proper formatting for files
1. run npm install prettier locally in the project
2. run npm install eslint locally in the project (optional)
3. create a .prettierrc file in the root of the project

conform should pickup the eslint and prettier config and utilise the prettier formatted that was locally installed from the project
unless you can get global prettier to work





