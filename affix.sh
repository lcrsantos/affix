#!/bin/bash -e

#elevation
# if [ "$UID" -eq 0 ] 
# then
# 	echo "thanks for the trust"
# 	# apt update
# else 
# 	echo "sorry but I'm gonna need you to trust me :)"
# 	exec sudo bash "$0" "$@"
# 	exit 0
# fi

#helpers
function here(){
	echo "$(cd "$( dirname "${BASH_SOURCE[1]}" )" >/dev/null 2>&1 && pwd )"
}
function using(){
	source "$(here)/$1"
}
function me(){
	echo "$(basename "${BASH_SOURCE[1]}")"
}
function inspect(){
	echo "running '$(basename "${BASH_SOURCE[1]}")' from '$(cd "$( dirname "${BASH_SOURCE[1]}" )" >/dev/null 2>&1 && pwd )'"
}

#usings
inspect
using "help/index.sh"

#shisha
function install(){
	source "$(here)/$1/$2.sh"
}


install bash "hyper"
install bash "zsh"
install bash "oh-my-zsh"
install bash "p10k"

install dev "vscode"

install apps "teams"
install apps "spotify"








purge_artifacts
