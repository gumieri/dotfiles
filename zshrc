# Disable software flow control
stty -ixon

## Settings
ZSH="${HOME}/.zsh"

ZSH_THEME="agnostic"

HISTFILE="${ZSH}/history"

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

## oh-my-zsh libs
for config_file ($HOME/.oh-my-zsh/lib/*.zsh)
do
  source $config_file
done
unset config_file

# Completion dump file
[[ -z $ZSH_COMPDUMP ]] && ZSH_COMPDUMP="${ZSH}/completion.${SHORT_HOST}.${ZSH_VERSION}.dump"
compinit -i -d $ZSH_COMPDUMP

# Theme
zsh_theme_path="${ZSH}/themes/${ZSH_THEME}.zsh-theme"
[[ -f $zsh_theme_path ]] && source $zsh_theme_path
unset zsh_theme_path

# Aliases
zsh_aliases="${ZSH}/aliases"
[[ -f $zsh_aliases ]] && source $zsh_aliases
unset zsh_aliases

# Local config
zsh_local="${ZSH}/local"
[[ -f $zsh_local ]] && source $zsh_local
unset zsh_local
