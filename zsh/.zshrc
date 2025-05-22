# Disable software flow control
stty -ixon

autoload -U compaudit compinit

autoload bashcompinit
bashcompinit

# Completion dump file
compinit -i -d $ZSH_COMPDUMP
_comp_options+=(globdots)

# My zsh libs
for config_file in $ZDOTDIR/lib/*.zsh
do
  source $config_file
done
unset config_file

# Theme
theme_path_zsh="${ZDOTDIR}/themes/${ZSH_THEME}.zsh"
[[ -f $theme_path_zsh ]] && source $theme_path_zsh
unset theme_path_zsh

# Add "local/bin" to the Path
[[ ! $PATH == *$HOME/.local/bin* ]] && PATH="${PATH}:${HOME}/.local/bin"

autoload -U +X bashcompinit && bashcompinit

HISTFILE="${XDG_STATE_HOME}/zsh/history"

if command -v starship > /dev/null
then
  export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
  eval "$(starship init zsh)"
fi

source $XDG_DATA_HOME/asdf/asdf.sh
