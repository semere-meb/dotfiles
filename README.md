# dotfiles

This repo contains the dotfiles for my archlinux
It is structured to work with stow
It is generic and can work for any *nix distro

### Tracked Folders and files ###

- zsh
- ghostty
- hyprland & utils
- hyprpanel
- kitty
- nvim
- rofi
- waybar
- wofi
- gtk config

### How to use it ###

Ensure the following pacakges are installed on your system

- git
- stow

```
sudo pacman -Syyu git stow
```

Steps:

First, clone the repo
```
git clone https://github.com/semere-meb/dotfiles.git
cd dotfiles
```

Then use stow to symlink everything
```
stow .
```

