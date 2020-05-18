# Installing Arch


Use rufus or someother program to put an iso on a USB.

## Connect to Internet
Use `ip addr show` to see ip address, or in most case lack thereof.
Use `wifi-menu` to use a TUI to connect to a wifi source
(If connected but no IP address --> `dhcpcd`).

## Update Repo Index
Edit `vim /etc/pacman.d/mirrorlist`(make a backup `/etc/pacman.d/mirrorlist.bak` just in case). Put a mirror from
the US at the top of the list. `:wq` and then update with `pacman -Syyy`.

## Partition HDD
Use `fdisk -l` (dash el) or use `lsblk`(easier to read in my opinion) to find the name of the internal HDD(could be name `/dev/sba` or `/dev/nvme0n1` use size to help determine).
Now to partition: `fdisk /dev/<disk_name>`

### Create the EFI Partition
Type `g` to create an empty GPT partition table. Then `n` for numbering the partition. Use the default for number, and for first sector. Then for last sector, use `+512M`. Then press `t` for changing the type of the partition to EFI System. Then press `1` for setting the partition to EFI.

Quick Guide:
```
fdisk /dev/<disk_name>
g
n
<enter>
<enter>
+512M
t
1
```

### Create Root Partition
I am ok with just having a root partition. That is how my Manjaro i3 machine was set up and I really liked how that machine was set up. Type `n` for numbering partition. Then enter three more times.
```
n
<enter>
<enter>
<enter>
```

### Write The Partitions
To write the partitions just type `w`. If there you want to examine the partitions before writing them use `p` to see them.


##Format the Partitions
### Format the EFI Partition 
Need to format the EFI partition to fat32. In the angle brackets where "PARTITION 1" is, replace with the name of the EFI parition name on your system, e.g, /dev/sda1.
```
mkfs.fat -F32 /dev/<PARTITION 1>
```

### Format the Root Partition
Using the naming scheme used for the EFI partition but changing the number 1 at the end to the number 2 for the root partition.  
```
mkfs.ext4 /dev/<PARTITION 2>
```

## Mount the Root Partition
Now we are going to install Arch to the root partition so mount it first.
```
mount /dev/<PARTITION 2> /mnt
```

## etc Directory and fstab file
TBH as of March 18th, literally no idea what this does.
```
mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

## Install God's OS
Time to install the Messiah of OS's.
```
pacstrap -i /mnt base
arch-chroot /mnt
pacman -S linux linux-headers
```

## Extra Packages Before Reboot
```
pacman -S vim base-devel networkmanager wpa_supplicant wireless_tools
```
Enable the networkmanager
```
systemctl enable NetworkManager
```

Initial Ramdisk (If using LTS, also do this for LTS.)
```
mkinitcpio -p linux
```

## TODO

## References

https://wiki.learnlinux.tv/index.php/How_to_Install_Arch_Linux#Overview

https://itsfoss.com/install-arch-linux/

https://youtu.be/a00wbjy2vns
