#!/bin/bash -e

#usings 
inspect

#shisha
snap_alias="snap"

if already_installed "/usr/bin" $snap_alias 
then 
	echo "app '$snap_alias' already installed"
	return 0
else
	sudo apt update
    sudo apt install -yf snapd
	sudo snap install snap-store
fi 


