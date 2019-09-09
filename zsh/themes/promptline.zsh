function __promptline_host {
  local only_if_ssh="0"

  if [ $only_if_ssh -eq 0 -o -n "${SSH_CLIENT}" ]
  then
    print %m
  fi
}

function __promptline_last_exit_code {

  [[ $last_exit_code -gt 0 ]] || return 1;

  printf "%s" "$last_exit_code"
}

function __promptline_vcs_branch {
  local branch
  local branch_symbol=" "

  # git
  if hash git 2>/dev/null
  then
    if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null ); then
      branch=${branch##*/}
      printf "%s" "${branch_symbol}${branch:-unknown}"
      return
    fi
  fi
  return 1
}

function __promptline_left_prompt {
  local slice_prefix slice_empty_prefix slice_joiner slice_suffix is_prompt_empty=1

  # section "warn" header
  slice_prefix="${warn_bg}${sep}${warn_fg}${warn_bg}${space}" slice_suffix="$space${warn_sep_fg}" slice_joiner="${warn_fg}${warn_bg}${alt_sep}${space}" slice_empty_prefix="${warn_fg}${warn_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"

  # section "a" header
  if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    slice_prefix="${a_bg}${sep}${a_fg}${a_bg}${space}" slice_suffix="$space${a_sep_fg}" slice_joiner="${a_fg}${a_bg}${alt_sep}${space}" slice_empty_prefix="${a_fg}${a_bg}${space}"
    [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
    # section "a" slices
    __promptline_wrapper "$(__promptline_host)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }
  fi

  # section "b" header
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
  then
    slice_prefix="${b_bg}${sep}${b_fg}${b_bg}${space}"
    slice_suffix="$space${b_sep_fg}"
    slice_joiner="${b_fg}${b_bg}${alt_sep}${space}"
    slice_empty_prefix="${b_fg}${b_bg}${space}"
    [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
    # section "b" slices
    __promptline_wrapper "$USER" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }
  fi

  # section "c" header
  slice_prefix="${c_bg}${sep}${c_fg}${c_bg}${space}"
  slice_suffix="$space${c_sep_fg}"
  slice_joiner="${c_fg}${c_bg}${alt_sep}${space}"
  slice_empty_prefix="${c_fg}${c_bg}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "c" slices
  __promptline_wrapper "[$(print -P %~)]\$" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # close sections
  printf "%s" "${reset_bg}${sep}${reset}"
}

function __promptline_right_prompt {
  local slice_prefix slice_empty_prefix slice_joiner slice_suffix

  # section "warn" header
  slice_prefix="${warn_sep_fg}${rsep}${warn_fg}${warn_bg}${space}" slice_suffix="$space${warn_sep_fg}" slice_joiner="${warn_fg}${warn_bg}${alt_rsep}${space}" slice_empty_prefix=""
  # section "warn" slices
  __promptline_wrapper "$(__promptline_last_exit_code)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  # section "y" header
  slice_prefix="${y_sep_fg}${rsep}${y_fg}${y_bg}${space}" slice_suffix="$space${y_sep_fg}" slice_joiner="${y_fg}${y_bg}${alt_rsep}${space}" slice_empty_prefix=""
  # section "y" slices
  __promptline_wrapper "$(__promptline_vcs_branch)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  # close sections
  printf "%s" "$reset"
}

function __promptline_wrapper {
  # wrap the text in $1 with $2 and $3, only if $1 is not empty
  # $2 and $3 typically contain non-content-text, like color escape codes and separators

  [[ -n "$1" ]] || return 1
  printf "%s" "${2}${1}${3}"
}

function __promptline {
  local last_exit_code="${PROMPTLINE_LAST_EXIT_CODE:-$?}"

  local esc=$'[' end_esc=m
  local noprint='%{' end_noprint='%}'
  local wrap="$noprint$esc" end_wrap="$end_esc$end_noprint"
  local space=" "
  local reset="${wrap}0${end_wrap}"
  local reset_bg="${wrap}49${end_wrap}"
  local a_fg="${wrap}38;5;235${end_wrap}"
  local a_bg="${wrap}48;5;246${end_wrap}"
  local a_sep_fg="${wrap}38;5;246${end_wrap}"
  local b_fg="${wrap}38;5;246${end_wrap}"
  local b_bg="${wrap}48;5;239${end_wrap}"
  local b_sep_fg="${wrap}38;5;239${end_wrap}"
  local c_fg="${wrap}38;5;246${end_wrap}"
  # "${wrap}48;5;237${end_wrap}"
  local c_bg=""
  local c_sep_fg="${wrap}38;5;237${end_wrap}"
  local warn_fg="${wrap}38;5;235${end_wrap}"
  local warn_bg="${wrap}48;5;208${end_wrap}"
  local warn_sep_fg="${wrap}38;5;208${end_wrap}"
  local y_fg="${wrap}38;5;246${end_wrap}"
  local y_bg="${wrap}48;5;239${end_wrap}"
  local y_sep_fg="${wrap}38;5;239${end_wrap}"
  local sep=""
  local rsep=""
  local alt_sep=""
  local alt_rsep=""
  PROMPT="$(__promptline_left_prompt)"
  RPROMPT="$(__promptline_right_prompt)"
}

if [[ ! ${precmd_functions[(r)__promptline]} == __promptline ]]
then
  precmd_functions+=(__promptline)
fi
