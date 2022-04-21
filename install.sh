#!/bin/bash
echo "Updating Mirrors..."; sleep 2
sudo cp mirrorlist/mirrorlist /etc/pacman.d/
sudo cp pacman/pacman.conf /etc/
sudo pacman -Syyuu
clear
echo 'Installing Chaotic AUR...'; sleep 2
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo '[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a  /etc/pacman.conf
sudo pacman -Syyuu
echo "Done"; sleep 2
clear
echo "Installing Base Packages..."; sleep 2
sudo pacman -S wget nano curl neofetch htop vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver update-grub --noconfirm
clear
echo "Installing Fonts..."; sleep 2
sudo pacman -S noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk inter-font ttf-fira-mono --noconfirm
clear
echo "Installing i3gaps + Core apps..."
sudo pacman -S i3 --noconfirm
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings rofi polybar xclip maim feh breeze thunar thunar-archive-plugin thunar-volman gvfs xarchiver mate-polkit zip unzip unrar tar p7zip gzip pigz lxappearance pavucontrol xfce4-terminal numlockx network-manager-applet arandr xdg-user-dirs xed --noconfirm
yay -S liberica-jdk-8-full-bin
xdg-user-dirs-update
sudo systemctl enable lightdm.service
clear
echo "Installing Apps..."; sleep 2
sudo pacman -S telegram-desktop discord steam vlc qbittorrent baobab gnome-disk-utility gnome-system-monitor plex-media-player teamviewer google-chrome code kvantum papirus-icon-theme sweet-gtk-theme-dark kvantum-theme-sweet-git --noconfirm
clear
cp -r i3/ ~/.config/
cp -r polybar/ ~/.config/
sudo cp rofi/sweet.rasi /usr/share/rofi/themes/
sudo cp -r icons/Sweet-Purple-Filled /usr/share/icons/
sudo cp wallpaper/arch.png /usr/share/wallpapers/
echo "Done!"; sleep 2
echo "Rebooting..."; sleep 3
reboot

