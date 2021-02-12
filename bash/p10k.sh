#!/bin/bash -e

#usings 
inspect

#shisha
p10k_alias="p10k"

function clone(){
	repo="$1"
	target="$2"
	target_name="$3"

	[ -d "$target" ] && sudo rm -r "$target" && echo "purging and cloning $target_name" || echo "cloning $target_name"
	git clone "$repo" "$target"
}

#TODO validation wrong
zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
zsh_plugin_as="$zsh_custom/plugins/zsh-autosuggestions"

if [ -d "$zsh_plugin_as" ]
then 
	echo "app '$p10k_alias' already installed"
	return 0
else
	p10k_theme="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
	clone "https://github.com/romkatv/powerlevel10k.git" "$p10k_theme" "p10k_theme"

	sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' "$HOME/.zshrc"

    #TODO missing installation of plugins and fonts
	zsh_plugin_sh="$zsh_custom/plugins/zsh-syntax-highlighting"
	clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$zsh_plugin_sh" "zsh_plugin_sh"

	clone "https://github.com/zsh-users/zsh-autosuggestions" "$zsh_plugin_as" "zsh_plugin_as"
	
	add_plugins="plugins+=( zsh-syntax-highlighting zsh-autosuggestions )"
	zshrc="$HOME/.zshrc"
	grep "$add_plugins" "$zshrc" && echo "plugins present" ||  echo "$add_plugins" >> "$zshrc" 
	
	function install_font(){
		name="$1"
		url="$2"

		font_ttf=$(artifact_path "$name")
		[ -f "$font_ttf" ] && rm "$font_ttf" && echo "purging and downloading $name" || echo "downloading $name"

		wget -O "$font_ttf" -NS "$url"
	}

	install_font "meslo_regular.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
	install_font "meslo_bold.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
	install_font "meslo_italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
	install_font "meslo_bold_italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
	
	fonts=$(artifact_path "*.ttf")
	for font in $fonts; do
		font_name=$(basename $font)
		os_fonts="/usr/share/fonts"
		echo "moving $font_name to $os_fonts"
		sudo mv -f "$font" "$os_fonts"
	done
	fc-cache -f -v
fi 


