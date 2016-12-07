#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

GROUPED=$(pacman -Sg xorg i3 | cut -d ' ' -f2 | tr '\n' ' ')
sudo pacman --needed -qSy $GROUPED python xf86-video-intel mesa-libgl vulkan-intel lib32-mesa-libgl git curl sudo openssh dmenu zsh urxvt-perls jshon python2 ruby lua perl tcl openconnect wpa_supplicant alsa-utils mpv udev wget the_silver_searcher xbindkeys imagemagick htop ttf-hack scrot
sudo pacman --needed -qSy gvim

# get aura
which aura || curl https://raw.githubusercontent.com/keenerd/packer/master/packer | bash -s -- -S --noconfirm aura-bin

# get nvm
[ -d ~/.nvm ] || curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

. ~/.nvm/nvm.sh
nvm install stable
nvm use stable

sudo aura --needed -qAy spotify google-chrome rxvt-unicode-patched tldr-cpp-client progress-git urxvt-font-git

if [ -f ~/.notebook ]; then
    sudo pacman --needed -qSy connman
    sudo aura --needed -qAy connman-ncurses connman_dmenu-git kbdlight
    sudo systemctl enable connman
    sudo systemctl start connman
    sudo systemctl disable netctl
    sudo systemctl stop netctl
    sudo sh -c "echo XHC1 > /proc/acpi/wakeup"
fi

[ "$(groups jake | grep audio)" ] || sudo usermod -g audio jake
[ -e /bin/google-chrome ] || sudo ln -s /bin/google-chrome-stable /bin/google-chrome

if [ ! "$(localectl list-locales | grep en_US.utf8)" ]; then
    sudo ln -s $DIR/locale.conf /etc/locale.conf
    sudo sh -c "grep -E '^en_US.UTF-8 UTF-8' /etc/locale.gen || echo en_US.UTF-8 UTF-8 >> /etc/locale.gen"
    sudo locale-gen
fi

sudo pacman -Syu
sudo aura -Ayu
