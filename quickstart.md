git clone this config to get access to the neovim

but for certain plugins to work properly, you will need to install the following:


Note: for fzf using the git method as it allows us to install the keybinds for bash terminal like ctrl + t for fzf as well as auto source the files

To override the controls, you want to put your export keybindings into .bashrc
e.g. 
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up'

If you want more information, you can view the keybinds in
.fzf/shell/key-bindings.bash


Install the following:
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



////////////.bashrc config

. "$HOME/.cargo/env"
export PATH=$PATH:/home/benjamin/.local/share/bob/nvim-bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias py=python3
alias python=python3
alias p=python3

# Override for fzf key bindings
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

bind "$(bind -s | grep fzf_history | sed 's/r/f/')"
bind '"\C-r": reverse-search-history'

export PATH=$PATH:/usr/local/go/bin

# export location of where neovide is 
export PATH=$PATH:/home/benjamin/.cargo/bin

# Fix issue of tmux not using neovim theme
alias tmux="TERM=screen-256color-bce tmux"




