# Disable software flow control
stty -ixon

# create zsh data/cache directories if dont exist
mkdir -p $XDG_DATA_HOME/zsh
mkdir -p $XDG_CACHE_HOME/zsh

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

# Add "local/bin" to the Path
[[ ! $PATH == *$HOME/.local/bin* ]] && PATH="${PATH}:${HOME}/.local/bin"

autoload -U +X bashcompinit && bashcompinit

EDITOR=nvim
