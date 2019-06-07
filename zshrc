XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Disable software flow control
stty -ixon

# create zsh data/cache directories if dont exist
mkdir -p $XDG_DATA_HOME/zsh
mkdir -p $XDG_CACHE_HOME/zsh

ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
HISTFILE="${XDG_DATA_HOME}/zsh/history"
ZSH_COMPDUMP="${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"
ZSH_THEME="promptline"

EDITOR=nvim
VISUAL=$EDITOR

autoload -U compaudit compinit

autoload bashcompinit
bashcompinit

# Completion dump file
compinit -i -d $ZSH_COMPDUMP

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

# Add ~/.zsh/bin to the Path
[[ ! $PATH == *$ZDOTDIR/bin* ]] && PATH="${PATH}:${ZDOTDIR}/bin"
