#!/bin/sh

#check root permission
[ $EUID -ne 0 ] && clear && echo "Error: This script must be run as root!" 1>&2 && exit 1