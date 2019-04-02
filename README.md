# gumieri/.files
```
git clone https://github.com/gumieri/dotfiles.git ~/dotfiles && ~/dotfiles/bin/setup
```

### Programs contemplated

#### vim
  Text editor.

#### zsh
  Shell.

#### tmux
  Terminal multiplexer.

#### sway
  Window manager.

#### rofi
  Application launcher.

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

## Sway

I am building all necessary packages for sway into fedora copr, to enable it:
```
sudo dnf copr enable gumieri/sway
```
The available packages are:
```
sudo dnf install sway swayidle swaylock waybar wl-clipboard slurp grim mako rofi
```
