#!/bin/bash
#pacman instalation

sudo pacman -S --noconfirm --needed "${packages[@]}"

#installing yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

#thunar
sudo pacman -S --needed thunar file-roller thunar-archive-plugin thunar-media-tags-plugin ffmpegthumbnailer tumbler gvfs gvfs-mtp

