#!/bin/bash
#pacman instalation

yes | sudo pacman -Syu
mapfile -t packages < <(grep -v '^#' "$(dirname "$0")/packages-list" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
# yes | sudo pacman -S --needed ghostty syncthing waybar ttc-iosevka imv mpv pavucontrol alsa-utils fastfetch hyprpolkitagent neovim grc hyprpaper cowfortune nwg-look stow ttf-nerd-fonts-symbols xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-wlr grim hyprshot noto-fonts noto-fonts-cjk noto-fonts-cjk noto-fonts-extra iwd impala bash-completion plymouth ly greetd greetd-regreet

#installing yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
rm -rf yay

#thunar
sudo pacman -S --needed thunar fileroller thunar-archive-plugin thunar-media-tags-plugin ffmpegthumbnailer tumbler gvfs
