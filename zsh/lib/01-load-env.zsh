if [[ $XDG_SESSION_TYPE == *"wayland"* ]]
then
  return
fi

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

set -o allexport
source $XDG_CONFIG_HOME/environment.d/xdg.conf
source $XDG_CONFIG_HOME/environment.d/zsh.conf
source $XDG_CONFIG_HOME/environment.d/personal.conf
set +o allexport
