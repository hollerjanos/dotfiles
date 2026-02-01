#===============================================================================
# Imports
#===============================================================================

# Aliases
[ -e $HOME/.config/zsh/.zsh_aliases ] && source $HOME/.config/zsh/.zsh_aliases

#===============================================================================
# Configurations
#===============================================================================

# Variables

export EDITOR="/usr/bin/nvim"
export TERMINAL="/${HOME}/.cargo/bin/alacritty"
export SHELL="/usr/bin/zsh"
export BROWSER="/usr/bin/firefox"
export MANPAGER="nvim +Man!" # Open man page as nvim
export TERM="xterm-256color"

export CONFIG="${HOME}/.config/"
export SCRIPTS="${HOME}/.scripts/"

# Turn on Vi mode

bindkey -v

# Turn off case sensitive auto-completion

autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"

# Prompt

PROMPT="%F{green}%1~%f "

# Keyboard

gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
gsettings set org.gnome.desktop.peripherals.keyboard delay 200

#===============================================================================
# After success
#===============================================================================

# Open up TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t holler || tmux new -s holler
fi

# Display a motivational text
if command -v motivation >/dev/null 2>%1; then
    motivation
fi
