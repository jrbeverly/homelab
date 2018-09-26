#!/bin/bash

## Vars
me=`basename "$0"`
title='Environment Installation'


## Functions
function error()
{
    dialog --backtitle "${title}" --msgbox "Application installation could not complete successfully" 20 60    
}

function installed()
{
    dialog --backtitle "${title}" --msgbox "Application was successfully installed" 20 60    
}

function uninstall()
{
    dialog --backtitle "${title}" --msgbox "Application was uninstalled" 20 60    
}

function hello_world()
{
    dialog --backtitle "${title}" --msgbox "Hello World" 20 60    
}

function main() {
    if [ $(id -u) -ne 0 ]; then
        printf "Script should be run as root. Try sudo ./${me}\n"
        #exit 1
    fi

    while true; do
        cmd=( dialog --backtitle "${title}" --menu "Choose task." 22 76 16 )
        options=(
                1 "Perform task #1"
                2 "Perform task #2"
                3 "Perform task #3"
                4 "Perform task #4"
        )
        choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)    
        if [ "$choice" != "" ]; then
            case $choice in
                1) installed ;;
                2) uninstall ;;
                3) error ;;
                4) hello_world ;;
            esac
        else
            break
        fi
    done
    clear
}

main