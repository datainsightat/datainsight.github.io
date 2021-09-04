# Installation Guide

## Efi Partition:

    https://wiki.archlinux.org/index.php/EFI_system_partition

    $ mkfs.fat -F32 /dev/sdxY

    $ pacstrap /mnt base linux linux-firmware dhcpcd net-tools iputils vim man-db man-pages amd-ucode efibootmgr grub sudo

    Network: https://wiki.archlinux.org/index.php/Network_configuration#DHCP

    ip link set enp2s0 up

## GRUB

    https://wiki.archlinux.org/index.php/GRUB

    $ grub-install --target=x86_64-efi --efi-directory=efi --bootloader-id=GRUB
    $ grub-mkconfig -o /boot/grub/grub.cfg

    Watchdog
    $ echo "kernel.watchdog_thresh=20" > /etc/sysctl.d/99-watchdog_thresh.conf

## 1st Boot

    $ ip link set enp34s0 up
    $ systemctl enable --now dhcpcd

## Post-Installation
    
    https://wiki.archlinux.org/index.php/General_recommendations



## wlan
    
    https://wiki.archlinux.org/index.php/wpa_supplicant
    wpa_cli > scan > scan_results > 


## NVIDIA
    
    https://wiki.archlinux.org/index.php/NVIDIA

    sudo pacman -S nvidia nvidia-utils nvidia-settings xorg xorg-server-devel opencl-nvidia

    Aus <https://computingforgeeks.com/easiest-way-to-install-nvidia-3d-graphics-acceleration-driver-on-archlinux/> 


## AUR

    $ git clone <repo>
    $ cd <repo>
    $ makepkg -si

## Pacman

    $ pacman -Syu
    $ pacman -S <tool>
    $ pacman -Rns <tool>

## Xbox Controller

    $ modprobe joydev
    $ lsusb
    $ ls /dev/input/js*

## xow

aur xow
    
    $ git clone https://aur.archlinux.org/xow.git
    $ cd xow
    $ makepkg -si
    $ sudo systemctl enable xow

Enable Pairing Mode
    
    $ sudo systemctl kill -s SIGUSR1 xow
  
# Source
  
https://wiki.archlinux.org/index.php/installation_guide
