#!/usr/bin/env bash

function alert(){
	MESSAGE=(read -p "$*")
	echo -e "\033[33m $MESSAGE \033[0m"
}

alert "Title of the Program"
whoami
hostname
uptime -p
uname -rms
echo  -e "\033[33;5mTitle of the Program\033[0m"
