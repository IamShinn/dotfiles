#!/bin/bash
#pacman instalation

yes | sudo pacman -Syu
yes | sudo pacman -S --needed ghostty syncthing waybar ttc-iosevka imv mpv pavucontrol fastfetch hyprpolkitagent neovim grc hyprpaper cowfortune nwg-look stow ttf-nerd-fonts-symbols xdg-desktop-portal xdg-desktop-portal-wlr grim hyprshot

#installing yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
rm -rf yay

#thunar
sudo pacman -S --needed thunar fileroller thunar-archive-plugin thunar-media-tags-plugin ffmpegthumbnailer tumbler gvfs
