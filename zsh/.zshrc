stty -ixon

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
[[ ! -d "$(dirname $HISTFILE)" ]] && mkdir -p "$(dirname $HISTFILE)"

[[ ! $PATH == *$HOME/.local/bin* ]] && PATH="${PATH}:${HOME}/.local/bin"

eval "$(sheldon source)"

autoload -U compaudit compinit bashcompinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit -i -d "${ZDOTDIR:-$HOME}/.zcompdump"
  bashcompinit
else
  compinit -C -d "${ZDOTDIR:-$HOME}/.zcompdump"
  bashcompinit
fi
_comp_options+=(globdots)

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
HISTSIZE=10000000
SAVEHIST=10000000
