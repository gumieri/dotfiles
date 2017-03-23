# Disable software flow control
stty -ixon

## Settings
ZSH=$HOME/.oh-my-zsh

NEW_ZSH=$HOME/.zsh

ZSH_THEME="agnostic"

ZSH_PLUGINS=("docker" "git" "tmux")

HISTFILE=$NEW_ZSH/history

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

# Add all defined plugins to fpath. This must be done before running compinit.
for plugin ($ZSH_PLUGINS)
do
  [[ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]] && fpath=($ZSH/plugins/$plugin $fpath)
done
unset plugin

for config_file ($ZSH/lib/*.zsh)
do
  source $config_file
done
unset config_file

# Completion dump file
[[ -z $ZSH_COMPDUMP ]] && ZSH_COMPDUMP=$NEW_ZSH/completion.$SHORT_HOST.$ZSH_VERSION.dump
compinit -i -d $ZSH_COMPDUMP

## Loading things

# Plugins
for plugin ($ZSH_PLUGINS)
do
  [[ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]] && source $ZSH/plugins/$plugin/$plugin.plugin.zsh
done
unset plugin

# Theme
[[ -f $NEW_ZSH/themes/$ZSH_THEME.zsh-theme ]] && source $NEW_ZSH/themes/$ZSH_THEME.zsh-theme

# Aliases
[[ -f $HOME/.zshrc.alias ]] && source $HOME/.zshrc.alias

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
