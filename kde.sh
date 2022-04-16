#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Sweden -a 6 --sort rate --save /etc/pacman.d/mirrorlist

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq


yay -S xorg sddm plasma-meta firefox simplescreenrecorder papirus-icon-theme kdenlive materia-kde kate-root yakuake xdg-desktop-portal-kde xdg-desktop-portal konsole dolphin-root ark latte-dock bitwarden timeshift deja-dup pamac-aur conky-lua conky-manager


sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"

