# gumieri/.files
```
git clone https://github.com/gumieri/dotfiles.git ~/dotfiles && ~/dotfiles/bin/setup
```

### Programs contemplated

#### vim
  Text editor.
  - default colorscheme: iceberg

#### zsh
  Shell.
  - default theme: promptline

#### tmux
  Terminal multiplexer.

#### sway
  Window manager.
  - GTK theme: Arc Dark

#### rofi
  Application launcher.
  - default theme: Arc Dark

#### kitty
  Terminal emulator.

## Dependencies of some programs

### vim-autoswap extension
* wmctrl

### asdf version manager
* automake
* autoconf
* libtool
* perl-Digest-SHA `// shasum`
* readline (dev)
* ncurses (dev)
* openssl (dev)
* libyaml (dev)
* libxslt (dev)
* libffi (dev)
* unixODBC (dev)

### Debian/Ubuntu
```
sudo apt-get install vim zsh tmux wmctrl automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
```

### RHEL/Centos
```
sudo yum install vim zsh tmux wmctrl automake autoconf perl-Digest-SHA readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel
```

### Fedora
```
sudo dnf install vim zsh tmux wmctrl automake autoconf perl-Digest-SHA readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel
```

### mac osx (homebrew)
```
sudo brew install vim zsh tmux wmctrl coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
```
