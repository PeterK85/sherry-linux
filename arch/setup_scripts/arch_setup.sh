#!/bin/bash

#TODO: Set up args for script 

# Used for installing Peter's "sherry-linux" def. NOT inspired by Luke Smith's setup script(LARBS). That was a joke, it is inspired by LARBS.

# Check if running as root - is supposed to be run inside the user that is being set up
if [ "$EUID" -ne 0 ]; then
    echo "Please run with sudo in the user you want to set it up for."
    exit
fi

# Check if dialog is installed.
pacman -Qi dialog > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "...dialog is not installed..."
    echo "...installing dialog..."
    pacman -S dialog --noconfirm
    exit
fi

# Welcome msg
dialog --title "Sherry Arch" --msgbox "This is a setup script for installing  Peter's personal arch install somewhat inspired by Luke Smith's LARBs, but mostly setup to replicated his old i3-gaps setup with a Nord theme." 10 85

dialog --title "Sherry Arch" --msgbox "This should take a few minutes to run and install everything. The script will setup dwm, st, the theme, vim, some qol tools and some extranious packages like Dwarf Fortress and RuneLite to play OSRS." 10 85

dialog --title "Ready or Not?" --yesno "Ready to start?" 6 25

if [ $? -eq 0 ]; then
    dialog --title "Really?" --yesno "Are you sure?" 6 25 
    if [ $? -eq 0 ]; then
        dialog --title "Ready..set..go." --msgbox "From here on out there will be assorted output on the screen of things installing. Press enter to begin install." 10 85
    fi
fi


clear

