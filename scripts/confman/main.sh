#!/bin/bash
##packages
sudo bash $(dirname "$0")/packages.sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


#yay operations
yay -S --noconfirm --needed zen-browser-bin
yay -S --noconfirm --needed tofi 
yay -S --noconfirm --needed tauon-music-box 
yay -S --noconfirm --needed dtach-ng-bin

##dotfiles
git clone https://github.com/IamShinn/dotfiles
cd dotfiles
sudo stow -S *

##dotfiles outside dotfiles
sudo cp -r ./boot/hyprland-mac-style/ /usr/share/plymouth/themes/
sudo plymouth-set-default-theme -R hyprland-mac-style 

yay -Yc --noconfirm
