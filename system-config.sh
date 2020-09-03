#!/bin/bash

# Personal settings
EMAIL="jake@hedman.email"
NAME="Jake Hedman"
REPO="JakeHedman/dotfiles"
USERNAME="jake"

# Exit on error
set -e

# Success/error message on exit
done=0
function finish {
  if [ $done == 1 ]; then
    echo SUCCESS: Done
  else
    echo ERROR: Crashed
  fi
}
trap finish EXIT

# Exit if missingroot privileges
if [ $(whoami) != "root" ]; then
  echo "I need root"
  exit 1
fi

# Create user
if [ ! -d /home/$USERNAME ]; then
  groupadd sudo
  useradd $USERNAME -mG sudo,audio
  read -sp "Password: " PASSWORD </dev/tty
  echo -e "$PASSWORD""\n""$PASSWORD""\n" | passwd "$USERNAME"
  unset PASSWORD
  sudo -u $USERNAME mkdir -p /home/$USERNAME/bin
  sudo -u $USERNAME mkdir -p /home/$USERNAME/.ssh
fi

# Install packages
pacman --noconfirm --needed -qSy \
  git \
  htop \
  i3status \
  intel-ucode \
  jshon \
  libnotify \
  mesa \
  modemmanager \
  networkmanager \
  nmap \
  nodejs \
  openssh \
  pavucontrol \
  progress \
  pulseaudio \
  python \
  python-prompt_toolkit \
  python2 \
  ripgrep \
  scrot \
  termite \
  tldr \
  ttf-liberation \
  usb_modeswitch \
  usbutils \
  yarn \
  docker \
  dmenu \
  blueman \
  xclip \
  fish \
  i3-wm \
  i3lock \
  i3blocks \
  pass \
  xorg \
  py3status \
  bash-completion \
  rofi \
  python-tldextract \
  pacman-contrib \
  vte3 \
  pv \
  go \
  npm \
  xorg-xinit

if ! which ttp; then
  npm install -g toggle-touchpad
fi

# Groups
usermod -a -G docker $USERNAME
usermod -a -G video $USERNAME

# Autostart docker
systemctl enable docker

# Install vim after python to get +python
pacman --noconfirm --needed -qSy neovim

# (Auto)start network stuff
systemctl enable NetworkManager
systemctl restart NetworkManager
systemctl enable ModemManager
systemctl restart ModemManager

# Wait for network
while ! curl http://example.com --connect-timeout 5 > /dev/null; do
  sleep 3
done

# give sudo to sudo group
SUDOCONF="%sudo ALL=(ALL) ALL"
if ! grep -Fx "$SUDOCONF" /etc/sudoers; then
  echo "$SUDOCONF" >> /etc/sudoers
fi

# yay
if ! which yay; then
  yaydir=$(sudo -u $USERNAME mktemp -d)
  git clone https://aur.archlinux.org/yay.git $yaydir
  cd $yaydir
  sudo -u $USERNAME makepkg
  ls
  pacman -U yay*.pkg.tar.zst --noconfirm
fi

# AUR packages
sudo -u $USERNAME yay -Sy --noconfirm \
  brightnessctl \
  google-chrome \
  ttf-ms-fonts \
  mimi-git \
  fish \
  starship \
  diff-so-fancy \
  ncspot-git \
  keybase \
  keybase-gui \
  nerd-fonts-complete

# shell
chsh -s /usr/bin/fish $USERNAME

# Set locale
if ! (localectl list-locales | grep en_US.utf8); then
  echo "LANG=en_US.UTF-8" > /etc/locale.conf
  echo "LC_ALL=en_US.UTF-8" >> /etc/locale.conf
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
  locale-gen
fi

# Full system upgrade
pacman --noconfirm -qSyu
env SUDO_USER="$USERNAME" yay --noconfirm -Ayu

# Don't clear tty after boot
mkdir -p /etc/systemd/system/getty@tty1.service.d/
NOCLEARPATH="/etc/systemd/system/getty@tty1.service.d/noclear.conf"
echo "[Service]" > "$NOCLEARPATH"
echo "TTYVTDisallocate=no" >> "$NOCLEARPATH"

# Keymap/font in tty
echo "KEYMAP=sv-latin1" > /etc/vconsole.conf
echo "FONT=ter-v22n" >> /etc/vconsole.conf

# Fix buggy trackpoint
echo "options psmouse proto=imps" > /etc/modprobe.d/trackpoint.conf

# Download this repo
REPOPATH="/home/$USERNAME/dotfiles"
if [ ! -d "$REPOPATH" ]; then
  sudo -u $USERNAME git clone git@github.com:"$REPO".git "$REPOPATH"
fi

# Symlink dotfiles
sudo -u $USERNAME /home/$USERNAME/dotfiles/link-dotfiles.sh

# Create LTE connection
LTEPATH="/etc/NetworkManager/system-connections/LTE"
if [ ! -f "$LTEPATH" ]; then
  echo "[connection]" > "$LTEPATH"
  echo "id=LTE" >> "$LTEPATH"
  echo "type=gsm" >> "$LTEPATH"
  echo "autoconnect=true" >> "$LTEPATH"
  echo "[gsm]" >> "$LTEPATH"
  echo "apn=4g.tele2.se" >> "$LTEPATH"
fi
chmod 600 "$LTEPATH"

# Load LTE config
nmcli con reload

# Set timezone
timedatectl set-timezone Europe/Stockholm

# Enable ntp
systemctl enable --now systemd-timesyncd.service

# Auto enable lte when wifi is down
cp /home/"$USERNAME"/dotfiles/lte-auto-toggle.sh /etc/NetworkManager/dispatcher.d/

# Backlight udev rules
cp /home/"$USERNAME"/dotfiles/backlight.rules /etc/udev/rules.d/backlight.rules

# Print success in trap
done=1
