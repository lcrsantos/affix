#!/bin/bash -e

#usings 
inspect

#shisha
vscode_alias="code"

if already_installed "/usr/bin" $vscode_alias 
then 
	echo "app '$vscode_alias' already installed"
	return 0
else
	vscode_deb=$(artifact_path "vscode.deb")
	echo "artifact '$vscode_deb'"

	[ -f $vscode_deb ] && rm "$vscode_deb"

	wget -O "$vscode_deb" -NS "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" 

	sudo apt install -yf "$vscode_deb"
fi 


