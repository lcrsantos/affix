#!/bin/bash -e

#usings 
inspect

#shisha
ohmyzsh_alias="oh-my-zsh"
ohmyzsh="$HOME/.$ohmyzsh_alias"
if already_installed "$ohmyzsh" "$ohmyzsh_alias.sh" 
then 
	echo "app '$ohmyzsh_alias' already installed"
	return 0
else
	[ -d  "$ohmyzsh" ] && sudo rm -r "$ohmyzsh" && echo "purging and installing oh my zsh" || echo "installing oh my zsh"
	export RUNZSH="no"
	sh -c "$(wget -NS -O - https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi 


