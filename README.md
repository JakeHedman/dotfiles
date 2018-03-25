# Arch Linux install cheat sheet

## Create usb
```sh
dd bs=4M if=/path/to/archlinux.iso of=/dev/sd... status=progress oflag=sync
```

## Install system
```sh
# Partition single ext4 partition (bootlable)
cfdisk /dev/disk/by-id/...
mkfs.ext4 -O "^64bit" /dev/disk/by-id/...-part1

# Mount to /mnt
mount /dev/disk/by-id/...-part1 /mnt

# Select mirror
vi /etc/pacman.d/mirrorlist

# Install system
pacstrap /mnt base base-devel

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot to new system
arch-chroot /mnt

# Install bootloader and intel microcode
pacman -Syu intel-ucode syslinux

# Install bootloader
syslinux-install_update -i -a -m

# Set root password
passwd

# Set hostname
echo hostname > /etc/hostname

# Configure bootloader
# - Short timeout: change "TIMEOUT 10" to "TIMEOUT 1"
# - Change partition path (APPEND root=...) to /dev/disk/by-uuid/UUID
# - Add intel-ucode after "APPEND ..." line under "LABEL arch":
#   INITRD ../intel-ucode.img,../initramfs-linux.img
vi /boot/syslinux/syslinux.cfg

# Reboot to live system and disconnect USB drive
reboot
```

## Network setup (optional)

```sh
# Install and enable networkmanager
pacman -Syu networkmanager
systemctl start NetworkManager

# Connect to wifi
nmtui
```

## System config script
```sh
# Set ssh host of system with files to fetch
export ALTHOST=jakob@192.168.1.111

# Run config script from github
curl https://raw.githubusercontent.com/JakeHedman/dotfiles/master/system-config.sh | bash
