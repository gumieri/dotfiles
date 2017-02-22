export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

DISABLE_AUTO_UPDATE="true"

plugins=(docker docker-compose git tmux wd)

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

# Disable software flow control
stty -ixon

# Aliases
[[ -f $HOME/.zshrc.alias ]] && source $HOME/.zshrc.alias

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
