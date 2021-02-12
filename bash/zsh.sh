#!/bin/bash -e

#usings 
inspect

#shisha
zsh_alias="zsh"

if already_installed "/usr/bin" $zsh_alias 
then 
	echo "app '$zsh_alias' already installed"
	return 0
else
	sudo apt install -yf zsh
	sudo chsh -s $(which zsh)
fi 


