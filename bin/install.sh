#!/bin/sh

# this system
apt-get install dialog
apt-get install figlet

# apps
apt-get install fizmo-console # zork
apt-get install nethack-console
apt-get install telnet # lambda moo

# slacker
apt-get install php5-cli
# ...and many more

exit

# VT220 SETUP
# set VT220 speed to 19200
#
# RPI SETUP
# wifi network config at /etc/network/interfaces
# linespeed set in /boot/cmdline.txt, change to 19200
# 
# (find-file "/pi@rpi:~/twwww-video-terminals/start.sh")
