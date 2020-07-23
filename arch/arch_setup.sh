#!/bin/bash
# NOTE: On my machines I have it so the password isn't needed to run sudo commands

#TODO: Set up args for script 

# Used for installing Peter's "sherry-linux" def. NOT inspired by Luke Smith's setup script(LARBS). That was a joke, it is inspired by LARBS.

# Check if dialog is installed.
pacman -Qi dialog > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "...dialog is not installed..."
    echo "...installing dialog..."
    sudo pacman -S dialog --noconfirm
fi

curr_dir=$(pwd)
desired_dir=$HOME/sherry-linux/arch

if [[ $curr_dir != $desired_dir ]]; then
    echo "Please put sherry-linux in the home dir(/home/user/)"
    exit
fi

# Welcome msg
dialog --title "Sherry Arch" --msgbox "This is a setup script for installing  Peter's personal arch install somewhat inspired by Luke Smith's LARBs, but mostly setup to replicated his old i3-gaps setup with a Nord theme." 10 85

dialog --title "Sherry Arch" --msgbox "This should take a few minutes to run and install everything. The script will setup dwm, st, the theme, vim, some qol tools and some extranious packages like Dwarf Fortress, Runelite and Stud.io." 10 85

dialog --title "Ready or Not?" --yesno "Ready to start?" 6 25

if [ $? -eq 0 ]; then
    dialog --title "Really?" --yesno "Are you sure?" 6 25 
    if [ $? -eq 0 ]; then
        dialog --title "Ready..set..go." --msgbox "From here on out there will be assorted output on the screen of things installing. Press enter to begin install." 10 85
    fi
fi

clear

#TODO -- this is a temp/test block
# These are the first few packages that are needed for getting a basic graphical env.
echo "Getting packages for suckless software..."
packages=("xorg-server" \
          "libx11" \
          "libxft" \
          "libxinerama" \
          "xorg-xinit" \
          "ttf-jetbrains-mono")

for pack in ${packages[*]}
do
    sudo pacman -S "$pack" --noconfirm
done

# check if .config dir exists -- if not create it
if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config
fi

# TODO - This block will eventually be replaced with custom dot files
# create dir for dmenu and then cd and git pull and make
# TODO maybe change to rofi(look into alts to dmenu)
echo "Setting up dmenu..."
cd "$HOME/.config"
# git clone https://git.suckless.org/dmenu
cp "$HOME/sherry-liunx/dot_files/dmenu" "$HOME/.config/"
cd dmenu
sudo make clean install

echo "Setting up st..."
cd "$HOME/.config/"
#TODO Replace with custom config file
# git clone https://git.suckless.org/st
cp "$HOME/sherry-linux/dot_files/st" "$HOME/.config/"
cd st
sudo make clean install

echo "Setting up dwm..."
#TODO Replace with custom config file
cd "$HOME/.config/"
# git clone https://git.suckless.org/dwm
cp "$HOME/sherry-linux/dot_files/st" "$HOME/.config/"
cd dwm
sudo make clean install

touch $HOME/.xinitrc
echo "exec dwm" >> $HOME/.xinitrc

#TODO -- end test/temp block


clear

echo "Ready to rock and roll"
echo "Start with startx"

