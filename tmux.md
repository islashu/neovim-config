unbind r
bind r source-file ~/.tmux.conf
# Must be set at the top of the file, else will not work
set -option repeat-time 30000
# change prefix key to C-s instead of C-b
set -g prefix C-s

# act like vim
set -g mode-keys vi
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R
# set pressing esc time to 0
set -s escape-time 0

# split panes using | and -
bind-key -r | split-window -h
bind-key -r _ split-window -v
bind-key -r x kill-pane

# Use arrow keys to resize
bind-key -r up resize-pane -U 10
bind-key -r down resize-pane -D 10
bind-key -r right resize-pane -R 10
bind-key -r left resize-pane -L 10

unbind c
unbind d

bind w new-window
bind C-p previous-window
bind C-n next-window

# Allow mouse scrolling
set -g mouse on

set -g @plugin 'tmux-plugins/tpm'
# allows hjkl to move between planes
set -g @plugin 'christoomey/vim-tmux-navigator'
# allows to copy to clipboard in commandline
set -g @plugin 'tmux-plugins/tmux-yank'

# save tmux sessions

set -g @resurrect-save 'c-s'
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

# Set prefix mode to stay active in 30s, this allow for continuous use for the
# prefix key without resetting after every key stroke, provided if you attach -r 
# to the key. This is effectively a toggle mode
run '~/.tmux/plugins/tpm/tpm'

## Remember to souce tmux, run prefix + I for update plugin
## tmux source ~/.tmux.conf
