#!/bin/bash -e

#usings
inspect

#shisha
function already_installed(){
	if [ -f "$1/$2" ] 
	then
		return 0
	else
		return 1
	fi
}

function ensure_dir(){
	if ! [ -d "$1" ]
	then
		mkdir "$1"
	fi
}

artifacts_affix="./artifacts.affix"
function artifact_path(){

	ensure_dir "$artifacts_affix"
	
	echo "$artifacts_affix/$1"
	
}

purge_artifacts(){

	rm -rf $artifacts_affix
	
}

