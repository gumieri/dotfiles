for local_config_file in $XDG_DATA_HOME/zsh/*.zsh
do
  source $local_config_file
done
unset local_config_file
