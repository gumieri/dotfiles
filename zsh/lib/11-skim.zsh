if sk_path=$(command -v sk)
then
  sk_root=$(dirname $sk_path)/..
  source $sk_root/share/skim/key-bindings.zsh
fi

