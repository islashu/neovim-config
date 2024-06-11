
unbind r
bind r source-file ~/.tmux.conf

# change prefix key to C-s instead of C-b
set -g prefix C-s

# act like vim
setw -g mode-keys vi
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R
# set pressing esc time to 0
set -s escape-time 0

# split panes using | and -
bind | split-window -h
bind - split-window -v



bind j resize-pane -U 10
bind k resize-pane -D 10
bind l resize-pane -R 10
bind h resize-pane -L 10


unbind c
bind w new-window
bind C-p previous-window
bind C-n next-window

# close plane
bind x kill-pane


set -g @plugin 'tmux-plugins/tpm'
# allows hjkl to move between planes
set -g @plugin 'christoomey/vim-tmux-navigator'
# allows to copy to clipboard in commandline
set -g @plugin 'tmux-plugins/tmux-yank'
# Show in prefix mode with custom color and background
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @prefix_highlight_fg 'white' # default is 'colour231'
set -g @prefix_highlight_bg 'green'  # default is 'colour04'
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_copy_mode_attr 'fg=black,bg=blue,bold' # default is 'fg=default,bg=yellow'
set -g @prefix_highlight_show_sync_mode 'on'
set -g @prefix_highlight_sync_mode_attr 'fg=black,bg=green' # default is 'fg=default,bg=yellow'
set -g @prefix_highlight_prefix_prompt 'Wait'
set -g @prefix_highlight_copy_prompt 'Copy'
set -g @prefix_highlight_sync_prompt 'Sync'


# save tmux sessions
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
# dracula theme
set -g @plugin 'dracula/tmux'

set -g @dracula-plugins "cpu-usage ram-usage weather time date "
set -g @dracula-show-timezone true
set -g @dracula-showpowerline true
set -g @dracula-fixed-location "Singapore"
set -g @dracula-continuum-mode time
set -g @dracula-continuum-time-threshold 60
set -g @dracula-show-flags true
set -g @dracula-show-left-icon session
set -g @dracula-show-fahrenheit false
set -g status-position top  
set -g @dracula-show-ssh-session-port true
set -g @dracula-time-format "%F %R"

## Update the saved session every five minuets.
set -g @continuum-save-interval '2'

## Enable automatic session restoring.
set -g @continuum-restore 'off'

## Fix Colors
set -g default-terminal "screen-256color"
set -as terminal-features ",xterm-256color:RGB"

run '~/.tmux/plugins/tpm/tpm'

## Remember to souce tmux
## tmux source ~/.tmux.conf
