# Disable software flow control
stty -ixon

# Settings
ZDOTDIR="${HOME}/.zsh"

ZSH_THEME="promptline"

HISTFILE="${ZDOTDIR}/history"

EDITOR=vim
VISUAL=$EDITOR

# oh-my-zsh libs
for config_file ($ZDOTDIR/oh-my-zsh/lib/*.zsh)
do
  source $config_file
done
unset config_file

autoload -U compaudit compinit

autoload bashcompinit
bashcompinit

# Completion dump file
[[ -z $ZSH_COMPDUMP ]] && ZSH_COMPDUMP="${ZDOTDIR}/completion.${SHORT_HOST}.${ZSH_VERSION}.dump"
compinit -i -d $ZSH_COMPDUMP

# My zsh libs
for config_file ($ZDOTDIR/lib/*.zsh)
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
