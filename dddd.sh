#!/bin/sh

#check root permission
#[ $EUID -ne 0 ] && clear && echo "Error: This script must be run as root!" 1>&2 && exit 1

red() {
    printf '\033[0;31m%b\033[0m' "$1"
}

green() {
    printf '\033[0;32m%b\033[0m' "$1"
}

yellow() {
    printf '\033[0;33m%b\033[0m' "$1"
}

blue() {
    printf '\033[0;34m%b\033[0m' "$1"
}

copyright() {
    clear
    echo "------------------- A dddd.sh Script By QuintinShaw ------------------"
    echo " Version            : $(green v2022-02-28)"
    echo " Usage              : $(yellow "wget -qO- dddd.sh | bash")"
    echo "----------------------------------------------------------------------"
    echo -e "\n"

}

mainboard() {
    copyright
    echo " dd                 : 1"
    echo " bench              : 2"
    echo -e "\n"
    read -r -p "Which option do you want? " option
    case $option in
        1) echo -e "\nWhich system do you want?\n"
    esac
}

mainboard