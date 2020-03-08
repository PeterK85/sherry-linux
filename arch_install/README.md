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
Type `n` for numbering partition. Then enter three more times.


## References

https://wiki.learnlinux.tv/index.php/How_to_Install_Arch_Linux#Overview

https://itsfoss.com/install-arch-linux/

https://youtu.be/a00wbjy2vns
