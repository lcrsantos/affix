#!/bin/bash -e

#usings 
inspect

#shisha
gnometweaks_alias="gnome-tweaks"

if already_installed "/usr/bin" $gnometweaks_alias 
then 
	echo "app '$gnometweaks_alias' already installed"
	return 0
else
	sudo add-apt-repository -y universe
	sudo apt install -yf gnome-tweak-tool
fi 


