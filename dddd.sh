#!/bin/sh

[ $EUID -ne 0 ] && clear && echo "Error: This script must be run as root!" 1>&2 && exit 1

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

script_name=dddd.sh
script_update=2023.03.29
script_version=0.0.0.1
script_cmd="bash <(wget -qO- dddd.sh)"
script_cmd2="bash <(curl -sL dddd.sh)"

copyright() {
  clear
  echo -e "
       [0;1;36;96m▄[0;1;34;94m▄[0m        [0;1;32;92m▄[0;1;36;96m▄[0m        [0;1;33;93m▄[0;1;32;92m▄[0m        [0;1;31;91m▄[0;1;33;93m▄[0m                      [0;1;31;91m▄[0;1;33;93m▄[0m
       [0;1;34;94m█[0;1;35;95m█[0m        [0;1;36;96m█[0;1;34;94m█[0m        [0;1;32;92m█[0;1;36;96m█[0m        [0;1;33;93m█[0;1;32;92m█[0m                      [0;1;33;93m█[0;1;32;92m█[0m
  [0;1;36;96m▄█[0;1;34;94m██[0;1;35;95m▄█[0;1;31;91m█[0m   [0;1;32;92m▄█[0;1;36;96m██[0;1;34;94m▄█[0;1;35;95m█[0m   [0;1;33;93m▄█[0;1;32;92m██[0;1;36;96m▄█[0;1;34;94m█[0m   [0;1;31;91m▄█[0;1;33;93m██[0;1;32;92m▄█[0;1;36;96m█[0m            [0;1;36;96m▄[0;1;34;94m▄█[0;1;35;95m██[0;1;31;91m██[0;1;33;93m▄[0m  [0;1;32;92m█[0;1;36;96m█▄[0;1;34;94m██[0;1;35;95m██[0;1;31;91m▄[0m
 [0;1;36;96m█[0;1;34;94m█▀[0m  [0;1;31;91m▀█[0;1;33;93m█[0m  [0;1;32;92m█[0;1;36;96m█▀[0m  [0;1;35;95m▀█[0;1;31;91m█[0m  [0;1;33;93m█[0;1;32;92m█▀[0m  [0;1;34;94m▀█[0;1;35;95m█[0m  [0;1;31;91m█[0;1;33;93m█▀[0m  [0;1;36;96m▀█[0;1;34;94m█[0m            [0;1;34;94m█[0;1;35;95m█▄[0;1;31;91m▄▄[0;1;33;93m▄[0m [0;1;32;92m▀[0m  [0;1;36;96m█[0;1;34;94m█▀[0m   [0;1;31;91m█[0;1;33;93m█[0m
 [0;1;34;94m█[0;1;35;95m█[0m    [0;1;33;93m█[0;1;32;92m█[0m  [0;1;36;96m█[0;1;34;94m█[0m    [0;1;31;91m█[0;1;33;93m█[0m  [0;1;32;92m█[0;1;36;96m█[0m    [0;1;35;95m█[0;1;31;91m█[0m  [0;1;33;93m█[0;1;32;92m█[0m    [0;1;34;94m█[0;1;35;95m█[0m             [0;1;31;91m▀▀[0;1;33;93m▀▀[0;1;32;92m██[0;1;36;96m▄[0m  [0;1;34;94m█[0;1;35;95m█[0m    [0;1;33;93m█[0;1;32;92m█[0m
 [0;1;35;95m▀[0;1;31;91m██[0;1;33;93m▄▄[0;1;32;92m██[0;1;36;96m█[0m  [0;1;34;94m▀[0;1;35;95m██[0;1;31;91m▄▄[0;1;33;93m██[0;1;32;92m█[0m  [0;1;36;96m▀[0;1;34;94m██[0;1;35;95m▄▄[0;1;31;91m██[0;1;33;93m█[0m  [0;1;32;92m▀[0;1;36;96m██[0;1;34;94m▄▄[0;1;35;95m██[0;1;31;91m█[0m     [0;1;36;96m██[0m     [0;1;31;91m█[0;1;33;93m▄▄[0;1;32;92m▄▄[0;1;36;96m▄█[0;1;34;94m█[0m  [0;1;35;95m█[0;1;31;91m█[0m    [0;1;32;92m█[0;1;36;96m█[0m
   [0;1;33;93m▀[0;1;32;92m▀▀[0m [0;1;36;96m▀[0;1;34;94m▀[0m    [0;1;31;91m▀[0;1;33;93m▀▀[0m [0;1;32;92m▀[0;1;36;96m▀[0m    [0;1;35;95m▀[0;1;31;91m▀▀[0m [0;1;33;93m▀[0;1;32;92m▀[0m    [0;1;34;94m▀[0;1;35;95m▀▀[0m [0;1;31;91m▀[0;1;33;93m▀[0m     [0;1;34;94m▀▀[0m      [0;1;32;92m▀▀[0;1;36;96m▀▀[0;1;34;94m▀▀[0m   [0;1;31;91m▀[0;1;33;93m▀[0m    [0;1;36;96m▀[0;1;34;94m▀[0m"
  echo "----------------------------------------------------------------------"
  echo " Name               : $(green $script_name)"
  echo " Version            : $(green $script_version)"
  echo " Date               : $(green $script_update)"
  echo " Usage              : $(yellow "$script_cmd")"
  echo "----------------------------------------------------------------------"
  echo -e "\n"
}

mainboard() {
  copyright
  echo " DD                 : 01"
  echo " Bench              : 02"
  echo " Kernel             : 03"
#  echo " 中文               : 99"
  echo " Exit               : 00"
  echo -e "\n"
  read -r -p "Which is your choice? " option
  case $option in
  1 | 01)
    dd
    ;;
  2 | 02)
    bench
    ;;
  3 | 03)
    kernel
    ;;
  *)
    echo -e "\nInvalid option\n"
    ;;
  0)
    echo -e "\n"
    exit 0
    ;;
  esac
}

dd(){
  install_dependence curl
  curl -sSL -o /tmp/dd.sh https://raw.githubusercontent.com/fcurrk/reinstall/master/NewReinstall.sh
  chmod a+x /tmp/dd.sh
  bash /tmp/dd.sh
}

bench(){
  install_dependence curl
  curl -sSL -o /tmp/bench.sh https://github.com/spiritLHLS/ecs/raw/main/ecs.sh
  chmod a+x /tmp/bench.sh
  bash /tmp/bench.sh
}

kernel(){
  install_dependence curl
  curl -sSL -o /tmp/kernel.sh https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcpx.sh
  chmod a+x /tmp/kernel.sh
  bash /tmp/kernel.sh
}

get_pack_manager() {
    if [ -f "/usr/bin/yum" ] && [ -d "/etc/yum.repos.d" ]; then
        pack_manager="yum";
    elif [ -f "/usr/bin/apt-get" ] && [ -f "/usr/bin/dpkg" ]; then
        pack_manager="apt-get"
    fi
}

install_dependence() {
    full=true;
    #check every needed_dependence
    for needed_dependence in `echo "$1" |sed 's/,/\n/g'`
        do
            if [[ -n "$needed_dependence" ]]; then
                found=false;
                #check each_path if have this dependence
                for each_path in `echo "$PATH" |sed 's/:/\n/g'`
                    do
                        #check if this needed_dependence is in this path
                        ls $each_path/$needed_dependence >/dev/null 2>&1;
                        #number of command not found
                        if [ $? == '0' ]; then
                            found=true;
                            break;
                        fi
                    done
                if $found; then
                    echo -ne "[$(green ok)]\t";
                else
                    if [ "$pack_manager" = "yum" ]; then
                        yum install -y "$needed_dependence"
                    elif [ "$pack_manager" = "apt-get" ]; then
                        apt-get install -y "$needed_dependence"
                    fi
                    for each_path in `echo "$PATH" |sed 's/:/\n/g'`
                        do
                            ls $each_path/$needed_dependence >/dev/null 2>&1;
                            if [ $? == '0' ]; then
                                found=true;
                                break;
                            fi
                        done
                    if $found; then
                        echo -ne "[$(green Installed)]";
                    else
                        full=false;
                        echo -ne "[$(red "Not Install")]";
                    fi
                fi
                echo -ne "\t$needed_dependence\n"
            fi
        done
    if ! $full; then
        echo -e "$(red "Error!") Can NOT install it."
        exit 1;
    fi
}

mainboard
