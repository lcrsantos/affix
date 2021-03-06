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

function purge_artifacts(){

	rm -rf $artifacts_affix
	
}

function clone(){
	repo="$1"
	target="$2"
	target_name="$3"

	[ -d "$target" ] && sudo rm -r "$target" && echo "purging and cloning $target_name" || echo "cloning $target_name"
	git clone "$repo" "$target"
}

function clone_as_artifact(){
	repo="$1"
	target_name="$2"

	target=$(artifact_path "$target_name")

	clone "$repo" "$target" "$target_name"
}