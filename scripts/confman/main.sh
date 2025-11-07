# !/bin/bash
#packages
sudo bash $(dirname "$0")/packages.sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

#yay operations
yay -S --noconfirm --needed zen-browser-bin
yay -S --noconfirm --needed tofi 
yay -S --noconfirm --needed tauon-music-box 
yay -S --noconfirm --needed dtach-ng-bin
yay -S --noconfirm --needed brightnessctl 
yay -S --noconfirm --needed sioyek

##dotfiles
# git clone https://github.com/IamShinn/dotfiles
cd dotfiles
sudo stow -D .
sudo stow -S .
cd ..

##dotfiles outside dotfiles
sudo cp -r $(dirname "$0")/boot/hyprland-mac-style/ /usr/share/plymouth/themes/
sudo plymouth-set-default-theme -R hyprland-mac-style 
sudo mkinitcpio -p linux

## set gtk theme
gsettings set org.gnome.desktop.interface gtk-theme 'oomox-me'
gsettings set org.gnome.desktop.interface icon-theme 'oomox-Gigavolt' 
gsettings get org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 11'


##greetd setup
sudo rm -rf /etc/greetd/ 
sudo mkdir /etc/greetd/
sudo cp -r "$(dirname "$0")/boot/greetd"/* /etc/greetd/
sudo mkdir /usr/share/bg
sudo cp -r dotfiles/scripts/confman/boot/greetd/bg2.jpg /usr/share/bg/bg2.jpg

## systemd 
systemctl enable tlp.service

yay -Yc --noconfirm
