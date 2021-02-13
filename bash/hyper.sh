#!/bin/bash -e

#usings 
inspect

#shisha
hyper_alias="hyper"

if already_installed "/usr/local/bin" $hyper_alias 
then 
	echo "app '$hyper_alias' already installed"
	return 0
else
	hyper_deb=$(artifact_path "hyper.deb")
	echo "artifact '$hyper_deb'"

	[ -f $hyper_deb ] && rm "$hyper_deb"

	wget -O "$hyper_deb" -NS "https://releases.hyper.is/download/deb" 

	sudo apt install -yf "$hyper_deb"

	sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/$hyper_alias 0
	sudo update-alternatives --set x-terminal-emulator /usr/local/bin/$hyper_alias
fi 


