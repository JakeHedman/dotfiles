# Arch Linux install cheat sheet

## Create usb

Find url of latest iso: https://ftp.acc.umu.se/mirror/archlinux/iso/latest/

```sh
curl -L https://... | dd of=/dev/sd... bs=4M status=progress oflag=sync
```

## Install system

Keymap and wifi (if needed)

```sh
loadkeys sv-latin1
wifi-menu
```

Clear old partition table

```sh
dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=1
```

Create partition table (gpt) and partitions according to the table

```sh
cfdisk /dev/disk/nvme0n1
```

| Device         | Mountpoint | Type                 | Size                     |
| -------------- | ---------- | -------------------- | ------------------------ |
| /dev/nvme0n1p1 | /          | Linux Filesystem     | Max possible             |
| /dev/nvme0n1p2 | /boot      | EFI System Partition | 1G                       |
| /dev/nvme0n1p3 | N/A        | Linux Swap           | >= RAM (for hibernation) |

Create filesystems

```sh
mkfs.ext4 /dev/nvme0n1p1
mkfs.fat -F32 /dev/nvme0n1p2
mkswap /dev/nvme0n1p3
```

Mount filesystems

```sh
mount /dev/nvme0n1p1 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot
```

Select umu.se mirror

```sh
vim /etc/pacman.d/mirrorlist
```

Install system

```sh
pacstrap /mnt base base-devel
```

Generate fstab

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

Chroot to new system

```sh
arch-chroot /mnt
```

Install packages

```sh
pacman -Syu networkmanager vim
```

Install systemd-boot

```sh
bootctl install
```

Configure systemd-boot

```sh
vim /boot/loader/entries/arch.conf
```

```
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
```

```sh
echo "options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme0n1p1) rw" >> /boot/loader/entries/arch.conf
```

TODO: Intel microcode stuff

Set hostname

```sh
echo hostname > /etc/hostname
```

Reboot to live system and disconnect USB drive

```sh
exit
reboot
```

## System config

Enable wlan interface and connect to wifi (if needed)

```sh
ip l set wlp4s0 up
systemctl enable NetworkManager
nmtui
```

Run system-config.sh

```sh
curl https://raw.githubusercontent.com/JakeHedman/dotfiles/master/system-config.sh | bash
```
