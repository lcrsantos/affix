#!/bin/bash -e

#usings 
inspect

#shisha
fira_font="firacode"

if [ -d "/usr/share/fonts/truetype/$fira_font" ]
then 
	echo "app '$fira_font' already installed"
	return 0
else
    sudo add-apt-repository universe -y
    sudo apt install fonts-firacode    
	fc-cache -f -v
fi 
