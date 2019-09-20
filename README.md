# gumieri/.files
```
git clone https://github.com/gumieri/dotfiles.git ~/dotfiles && ~/dotfiles/bin/setup
```

### Programs contemplated

#### Alacritty
  Terminal emulator.

#### zsh
  Shell.

#### neovim
  Text editor.

#### sway
  Window manager.

#### swaylock
  Screen locker for sway.

#### swayidle
  Idle amanagement daemon for sway.

#### waybar
  Wayland bar for sway.

#### rofi
  Application launcher.

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
sudo apt-get install neovim zsh wmctrl automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
```

### Fedora
```
sudo dnf install neovim zsh wmctrl automake autoconf perl-Digest-SHA readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel
```

### mac osx (homebrew)
```
sudo brew install neovim zsh wmctrl coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
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
