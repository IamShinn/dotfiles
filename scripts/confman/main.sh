# !/bin/bash
sudo bash $(dirname "$0")/packages.sh
cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin


git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

#yay operations
yay -S --noconfirm --needed zen-browser-bin
yay -S --noconfirm --needed tofi 
yay -S --noconfirm --needed tauon-music-box 
yay -S --noconfirm --needed brightnessctl 
yay -S --noconfirm --needed sioyek
yay -S --noconfirm --needed cudatext-gtk2-bin

##dotfiles
# git clone https://github.com/IamShinn/dotfiles
cd dotfiles
sudo stow -D .
sudo stow -S .
cd ..

##dotfiles outside dotfiles
sudo tee /etc/mkinitcpio.conf.d/custom-hooks.conf <<EOF >/dev/null
HOOKS=(base systemd plymouth autodetect microcode modconf kms keyboard keymap sd-vconsole block filesystems fsck)
EOF
sudo cp -r $(dirname "$0")/boot/hyprland-mac-style/ /usr/share/plymouth/themes/
sudo plymouth-set-default-theme -R hyprland-mac-style 
sudo mkinitcpio -p linux -c custom-hooks.conf

## set gtk theme
gsettings set org.gnome.desktop.interface gtk-theme 'oomox-me'
gsettings set org.gnome.desktop.interface icon-theme 'Macs Green-Blue' 
gsettings get org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 11'
gsettings set org.gnome.desktop.interface cursor-theme 'Posy Cursor Black'

##greetd setup
sudo rm -rf /etc/greetd/ 
sudo mkdir /etc/greetd/
sudo cp -r "$(dirname "$0")/boot/greetd"/* /etc/greetd/
sudo mkdir /usr/share/bg
sudo cp -r dotfiles/scripts/confman/boot/greetd/bg2.jpg /usr/share/bg/bg2.jpg
sudo cp -r dotfiles/scripts/confman/boot/default.desktop /usr/share/wayland-sessions/
sudo tee /var/lib/regreet/state.toml <<EOF >/dev/null
[user_to_last_sess]
me = "Default"
EOF

## systemd 
systemctl enable tlp.service

yay -Yc --noconfirm
