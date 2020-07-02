#!/bin/bash

# Set this manually
email=""
name=""
user=""
pass=""

###
# Use this script to set up git on a new machine(bash terminal)
###

# To get this script git already has to be installed...

mkdir ~/.config/git
touch ~/.config/git/config

echo "[user]" >> ~/.config/git/config
echo -e "\temail=$email" >> ~/.config/git/config
echo -e "\tname=$name" >> ~/.config/git/config

touch ~/.config/git/credentials

echo "https://$user:$pass@github.com" >> ~/.config/git/credentials

git config credntial.helper store
