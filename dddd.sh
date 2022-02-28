#!/bin/sh

#check root permission
[ $EUID -ne 0 ] && clear && echo "Error: This script must be run as root!" 1>&2 && exit 1

function CopyRight() {
    clear
    echo "------------------- A dddd.sh Script By QuintinShaw ------------------"
    echo " Version            : v2022-02-28"
    echo " Usage              : wget -qO- dddd.sh | bash"
    echo "----------------------------------------------------------------------"
}

CopyRight