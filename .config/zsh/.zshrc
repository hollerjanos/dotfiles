#==============================
# Configuration(s)
#==============================

# Variable(s)

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export MANPAGER="nvim +Man!" # Open man page as nvim
export TERM="xterm-256color"

# Turn on Vi mode

bindkey -v

# Turn off case sensitive auto-completion

autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"

# Prompt

PROMPT="%F{green}%1~%f "

#==============================
# Alias(es)
#==============================

# Alias(es)
[ -e $HOME/.config/zsh/.zsh_aliases ] && source $HOME/.config/zsh/.zsh_aliases
