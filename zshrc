# Disable software flow control
stty -ixon

# Settings
ZSH="${HOME}/.zsh"

ZSH_THEME="agnostic"

HISTFILE="${ZSH}/history"

# oh-my-zsh libs
for config_file ($ZSH/oh-my-zsh/lib/*.zsh)
do
  source $config_file
done
unset config_file

autoload -U compaudit compinit

autoload bashcompinit
bashcompinit

# Completion dump file
[[ -z $ZSH_COMPDUMP ]] && ZSH_COMPDUMP="${ZSH}/completion.${SHORT_HOST}.${ZSH_VERSION}.dump"
compinit -i -d $ZSH_COMPDUMP

# My zsh libs
for config_file ($ZSH/lib/*.zsh)
do
  source $config_file
done
unset config_file

# Theme
theme_path_zsh="${ZSH}/themes/${ZSH_THEME}.zsh"
[[ -f $theme_path_zsh ]] && source $theme_path_zsh
unset theme_path_zsh

# Add ~/.zsh/bin to the Path
[[ ! $PATH == *$ZSH/bin* ]] && PATH="${PATH}:${ZSH}/bin"
