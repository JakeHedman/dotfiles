#!/bin/sh

sudo pacman --needed -Sy python xf86-video-intel mesa-libgl xorg i3 vulkan-intel lib32-mesa-libgl git curl sudo openssh dmenu zsh urxvt-perls jshon python2 ruby lua perl tcl openconnect wpa_supplicant alsa-utils mpv udev wget the_silver_searcher xbindkeys imagemagick
sudo pacman --needed -Sy gvim

# get aura
which aura || curl https://raw.githubusercontent.com/keenerd/packer/master/packer | bash -s -- -S --noconfirm aura-bin

# get nvm
which nvm || curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

. ~/.nvm/nvm.sh
nvm install stable
nvm use stable

sudo aura --needed -Ay spotify google-chrome rxvt-unicode-patched tldr-cpp-client

if [ -f ~/.notebook ]; then
    sudo pacman --needed -Sy connman
    sudo aura --needed -Ay connman-ncurses connman_dmenu-git kbdlight
    sudo systemctl enable connman
    sudo systemctl start connman
    sudo systemctl disable netctl
    sudo systemctl stop netctl
    sudo sh -c "echo XHC1 > /proc/acpi/wakeup"
fi

sudo usermod -g audio jake
