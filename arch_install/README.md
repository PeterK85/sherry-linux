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



## References

https://wiki.learnlinux.tv/index.php/How_to_Install_Arch_Linux#Overview

https://itsfoss.com/install-arch-linux/

https://youtu.be/a00wbjy2vns
