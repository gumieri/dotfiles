alias l='exa -lha'
alias ll='exa -1a'
alias lc='wc -l'
alias vim='nvim'
alias todo='vim -c "set nonumber" ~/todo.md'
alias lb='note e logbook'
alias envfile='env $(cat .env | xargs)'
alias ssh='TERM=xterm-256color ssh'
alias gitpatch="git tag | sort -Vr | head -n 1 | awk -F. '{\$3++; print \$0}' | sed 's/ /./g'"
