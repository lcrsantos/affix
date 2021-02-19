#!/bin/bash -e

#usings 
inspect

#shisha
discord_alias="discord"

if snap list | grep $discord_alias
then 
	echo "app '$discord_alias' already installed"
	return 0
else
    sudo snap install $discord_alias
    sudo snap connect discord:system-observe
    
fi 


