#!/bin/bash -e

#usings 
inspect ${BASH_SOURCE[0]}

#shisha
spotify_alias="spotify"

if already_installed "/usr/bin" $spotify_alias 
then 
	echo "app '$spotify_alias' already installed"
	return 0
else
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

	sudo apt update
	sudo apt install -yf spotify-client

fi 


