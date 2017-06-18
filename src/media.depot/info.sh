#!/bin/bash

function main_remove()
{
    dialog --backtitle "urbanswelt.de - DelugePi Setup." --msgbox "Deluge was deleted from your System =( " 20 60
}

if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root. Try 'sudo ./DelugePi_setup'\n"
  exit 1
fi

# The functions for configuring the server need to be in a separate script.sh
# This is important!
# Why? So that we can have the GUI script (interactive) and
# have a non-interactive version.  The advantage is clear.

# Then with this we can have a quick-install script
# an example script
# something like (pull script (or store it), include script, then call functions)
# Perform some outputting and finish the overall task.

# TODO:
#   Need to be able to manually set all properties
#   Need to be able to test properties?
#
#   Need to be able to pull all related properties (docker-compose pull)
#   Install the application (based on set properties)
#   Update/Upgrade the installation
#   Remove the installation (fully)
#
#

while true; do
    cmd=(dialog --backtitle "urbanswelt.de - DelugePi Setup." --menu "Choose task." 22 76 16)
    options=(1 "Set special Deluge Port ($__delugeport) not implemented yet"
             2 "New clean Server installation, Branch 1.3.stable"
             3 "New clean Standard installation, Branch 1.3.stable"
             4 "New clean Development installation, Branch Master with debug log"
             5 "Setup Plugin Notification"
             6 "Update existing media.depot installation"
             7 "Update existing Deluge Master Branch"
             8 "Remove existing Deluge installation")
    choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    if [ "$choice" != "" ]; then
        case $choice in
            1) main_remove ;;
            2) main_remove ;;
            3) main_remove ;;
            4) main_remove ;;
            5) main_remove ;;
            6) main_remove ;;
            7) main_remove ;;
            8) main_remove ;;
        esac
    else
        break
    fi
done
clear
