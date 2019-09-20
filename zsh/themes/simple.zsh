reset=$'\e[0m'

black=$'\e[0;30m'   # Black
red=$'\e[0;31m'     # Red
green=$'\e[0;32m'   # Green
yellow=$'\e[0;33m'  # Yellow
blue=$'\e[0;34m'    # Blue
magenta=$'\e[0;35m' # Magenta
cyan=$'\e[0;36m'    # Cyan

bold_black=$'\e[1;30m'   # Black
bold_red=$'\e[1;31m'     # Red
bold_green=$'\e[1;32m'   # Green
bold_yellow=$'\e[1;33m'  # Yellow
bold_blue=$'\e[1;34m'    # Blue
bold_magenta=$'\e[1;35m' # Magenta
bold_cyan=$'\e[1;36m'    # Cyan

function __exit_prompt {
  local exit_code=$?
  [[ $exit_code -ne 0 ]] && echo "%{$bold_red%}[$exit_code]%{$reset%}"
}

function __git_prompt {
  [ !hash git 2>/dev/null ] && return 1

  if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null )
  then
    branch=${branch##*/}
    echo "%{$bold_yellow%}[%{$reset%}${branch:-unknown}%{$bold_yellow%}]%{$reset%}"
    return
  fi

  return 1
}

setopt PROMPT_SUBST

PROMPT="%{$bold_blue%}[%{$reset%}%# "

RPROMPT=' %~%{$bold_blue%}]%{$reset%}$(__exit_prompt)$(__git_prompt)'
