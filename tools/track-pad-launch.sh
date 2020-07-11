#!/bin/bash

sudo modprobe -r pcspkr
sudo sh -c 'echo -n "elantech"> /sys/bus/serio/devices/serio1/protocol'
