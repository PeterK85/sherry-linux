#!/bin/bash

###
# Use this script to set up git on a new machine(bash terminal)
###

if pacman -Qs git > /dev/null; then
    echo "git is installed"
else
    echo "git is no tinstalled"
fi
