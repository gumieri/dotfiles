if [ ! -f "/opt/homebrew/bin/brew" ]
then
  return
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.sh

# FZF
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# ZSH
test -e "/opt/homebrew/share/zsh/site-functions" \
  && source "/opt/homebrew/share/zsh/site-functions"
