bindkey -e

typeset -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Ctrl+A: AWS Context Switcher (based on starship expected Env Vars)
function myawsctx {
  if ! (( $+commands[aws] )); then echo "AWS CLI not found"; return; fi

  local chosen=$(aws configure list-profiles | fzf --height 40% --layout=reverse --border --prompt="AWS Profile > ")
  
  if [[ -n "$chosen" ]]; then
    mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/myaws"
    echo "$chosen" > "${XDG_CONFIG_HOME:-$HOME/.config}/myaws/default_profile"
    
    export AWS_SSO_PROFILE="$chosen"
    export AWS_PROFILE="$chosen"
    
    echo -e "\n\033[32mAWS Profile: $chosen\033[0m"
    zle reset-prompt
  fi
}
zle -N myawsctx
bindkey '^a' myawsctx

# Alt+K / Alt+N: Kubernetes Shortcuts
bindkey -s '^[k' 'kubectx\n'
bindkey -s '^[n' 'kubens\n'
