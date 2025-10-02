#!/bin/bash
##packages
sudo bash $(dirname "$0")/packages.sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


#yay operations
yay -S --noconfirm --needed zen-browser-bin
yay -S --noconfirm --needed tofi 
yay -S --noconfirm --needed tauon-music-box 

##dotfiles
git clone https://github.com/IamShinn/dotfiles
cd dotfiles
sudo stow -S *

yay -Yc
