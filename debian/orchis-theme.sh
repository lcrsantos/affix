#!/bin/bash -e

#usings 
inspect

#shisha
orchis_theme="orchis-themes"

if snap list | grep $orchis_theme
then 
	echo "app '$orchis_theme' already installed"
	return 0
else
    sudo apt install -yf gnome-shell-extensions
    sudo snap install orchis-themes
    
    available_connections=$(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}')
    for available_connection in $available_connections; do
        sudo snap connect "$available_connection" orchis-themes:gtk-3-themes
    done

    # clone_as_artifact "https://github.com/vinceliuice/Orchis-theme.git" $orchis_theme
    # orchis=$(artifact_path "$orchis_theme")
    # "./$orchis/install.sh" -t all
    # "$orchis/src/gnome-shell/extensions/dash-to-panel/install.sh"
fi 


