reset=$'\e[0m'

regular_black=$'\e[0;30m'   # Black
regular_red=$'\e[0;31m'     # Red
regular_green=$'\e[0;32m'   # Green
regular_yellow=$'\e[0;33m'  # Yellow
regular_blue=$'\e[0;34m'    # Blue
regular_magenta=$'\e[0;35m' # Magenta
regular_cyan=$'\e[0;36m'    # Cyan

bold_black=$'\e[1;30m'   # Black
bold_red=$'\e[1;31m'     # Red
bold_green=$'\e[1;32m'   # Green
bold_yellow=$'\e[1;33m'  # Yellow
bold_blue=$'\e[1;34m'    # Blue
bold_magenta=$'\e[1;35m' # Magenta
bold_cyan=$'\e[1;36m'    # Cyan

function __git_branch {
  local branch

  # git
  if hash git 2>/dev/null
  then
    if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null )
    then
      branch=${branch##*/}
      echo "%{$bold_yellow%}[${branch:-unknown}]%{$reset%}"
      return
    fi
  fi
  return 1
}

function __last_exit_code {
  local exit_code=$?

  [[ $exit_code -ne 0 ]] && echo "%{$bold_red%}[$exit_code]%{$reset%}"
}

setopt PROMPT_SUBST

PROMPT="%{$bold_blue%}[%{$reset%}%~%{$bold_blue%}]%{$reset%}% \$ "

RPROMPT='$(__last_exit_code)$(__git_branch)'
