#!/bin/bash
#pacman instalation

yes | sudo pacman -Syu
mapfile -t packages < <(grep -v '^#' "$(dirname "$0")/packages-list" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

#installing yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

#thunar
sudo pacman -S --needed thunar fileroller thunar-archive-plugin thunar-media-tags-plugin ffmpegthumbnailer tumbler gvfs

