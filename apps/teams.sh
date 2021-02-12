#!/bin/bash -e

#usings 
inspect ${BASH_SOURCE[0]}

#shisha
teams_alias="teams"

if already_installed "/usr/bin" $teams_alias 
then 
	echo "app '$teams_alias' already installed"
	return 0
else
	teams_deb=$(artifact_path "teams.deb")
	echo "artifact '$teams_deb'"

	[ -f $teams_deb ] && rm "$teams_deb"

	wget -O "$teams_deb" -NS "https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x409&culture=en-us&country=US" 

	sudo apt install -yf "$teams_deb"
fi 


