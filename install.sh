#!/bin/sh

# make filesystem
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3

# base install
mount /dev/sda3 /mnt
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# chroot
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

