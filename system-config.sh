#!/bin/sh

# user to be created
USERNAME=jake

# Exit if missingroot privileges
[ $(whoami) != 'root' ] && echo 'I need root' && exit 1

# Install packages
pacman --needed -qSy \
  git \
  htop \
  i3status \
  jshon \
  libnotify \
  mesa \
  nmap \
  nodejs \
  openssh \
  progress \
  python \
  python2 \
  ripgrep \
  scrot \
  sway \
  termite \
  tldr \
  ttf-hack \
  python-prompt_toolkit \
  ttf-liberation

# Install vim after python to get +python
pacman --needed -qSy gvim

# give sudo to sudo group
grep -Fx '%sudo ALL=(ALL) ALL' /etc/sudoers || echo '%sudo ALL=(ALL) ALL' >> /etc/sudoers

# Create user
groupadd sudo
useradd $USERNAME -mG sudo,audio && passwd $USERNAME
sudo -u $USERNAME mkdir /home/$USERNAME/bin

# Git config
sudo -u $USERNAME git config --global user.email 'jake@hedman.email'
sudo -u $USERNAME git config --global user.name 'Jake Hedman'

# Install aur client aura using aur client packer
which aura || curl https://raw.githubusercontent.com/keenerd/packer/master/packer | sudo -u $USERNAME bash -s -- -S --noconfirm aura-bin

# AUR packages
sudo -u $USERNAME sudo aura --needed -Ay xonsh google-chrome ttf-ms-fonts spotify brightnessctl

# Use xonsh shell from AUR
chsh -s /usr/bin/xonsh $USERNAME

if [ -z "$ALTHOST" ]; then
  echo 'WARNING: Missing $ALTHOST'
else
  # Fetch ssh config
  [ ! -f /home/$USERNAME/.ssh/private_config ] && sudo -u $USERNAME scp $ALTHOST:.ssh/{id_rsa,id_rsa.pub,private_config} /home/$USERNAME/.ssh 
fi

# Set locale
if [ ! "$(localectl list-locales | grep en_US.utf8)" ]; then
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
    echo "LC_ALL=en_US.UTF-8" >> /etc/locale.conf
    echo en_US.UTF-8 UTF-8 > /etc/locale.gen
    locale-gen
fi

# Full system upgrade
pacman -Syu
sudo -u $USERNAME sudo aura -Ayu

# Don't clear tty after boot
mkdir -p /etc/systemd/system/getty@tty1.service.d/
echo -e "[Service]\nTTYVTDisallocate=no" > /etc/systemd/system/getty@tty1.service.d/noclear.conf

# Keymap/font in tty
echo -e "KEYMAP=sv-latin1\nFONT=ter-v22n" > /etc/vconsole.conf

# Fix buggy trackpoint
echo "options psmouse proto=imps" > /etc/modprobe.d/trackpoint.conf

# Download this repo
sudo -u $USERNAME git clone git@github.com:JakeHedman/dotfiles.git /home/$USERNAME/dotfiles

# Symlink dotfiles
sudo -u $USERNAME /home/$USERNAME/dotfiles/link-dotfiles.sh
