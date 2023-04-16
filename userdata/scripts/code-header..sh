#!/usr/bin/env bash
#  _____ _____
# \_   _\_   _\    Thomas Tiveron (tomtiv)
#   | |   | |      http://www.youtube.com/c/tomtiv
#   | |   | |      http://www.gitlab.com/tomtiv/
#   |_|   |_|
#
# My zsh config. Not much to see here; just some pretty standard stuff.
# NAME: DTOS
# DESC: An installation and deployment script for DT's Xmonad desktop.
# WARNING: Run this script at your own risk.
# DEPENDENCIES: libnewt (probably already on the system)

if [ "$(id -u)" = 0 ]; then
    echo "##################################################################"
    echo "This script MUST NOT be run as root user since it makes changes"
    echo "to the \$HOME directory of the \$USER executing this script."
    echo "The \$HOME directory of the root user is, of course, '/root'."
    echo "We don't want to mess around in there. So run this script as a"
    echo "normal user. You will be asked for a sudo password when necessary."
    echo "##################################################################"
    exit 1
fi

error() { \
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

# export NEWT_COLORS="
# root=,blue
# window=,black
# shadow=,blue
# border=blue,black
# title=blue,black
# textbox=blue,black
# radiolist=black,black
# label=black,blue
# checkbox=black,blue
# compactbutton=black,blue
# button=black,red"

