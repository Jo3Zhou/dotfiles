#!/bin/bash

# Color
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # no color

# The funciton to link file at $HOME
link_home_config() {
	local source_name=$1
	local target_name=$2

	local source_directory=$(pwd)
	local target_directory="$HOME"

	local item_source_path="$source_directory/$source_name"
	local item_target_path="$target_directory/$target_name"

	echo "item_source_path: $item_source_path"
	echo "item_target_path: $item_target_path"

	# Check if item source path exists
	if [ ! -e "$item_source_path" ]; then
		echo -e "${RED}Error:${NC} Source path '$item_source_path' does not exist."
		return 1
	fi

	# Check if target path already exists
	if [ -e "$item_target_path" ]; then
		# Remove existing target path
		rm -rf "$item_target_path"
		echo -e "${ORANGE}Warning:${NC} Removed existing target path '$item_target_path'."
	fi

	# Create symbolic link
	ln -s "$item_source_path" "$item_target_path"

	# Check if linking was successful
	if [ $? -eq 0 ]; then
		echo -e "Linking of ${GREEN}$source_name -> $target_name${NC} successful"
	else
		echo -e "Linking of ${RED}$source_name -> $target_name${NC} failed."
	fi
}

# Function to link folder or file to specified path
link_xdg_config() {
	local item_name=$1

	# Source directory
	source_directory=$(pwd)
	# XDG target directory
	target_directory="$HOME/.config"

	local item_source_path="$source_directory/$item_name"
	local item_target_path="$target_directory/$item_name"

	echo "item_source_path: $item_source_path"
	echo "item_target_path: $item_target_path"

	# Check if item source path exists
	if [ ! -e "$item_source_path" ]; then
		echo -e "${RED}Error:${NC} Source path '$item_source_path' does not exist."
		return 1
	fi

	# Check if target path already exists
	if [ -e "$item_target_path" ]; then
		# Remove existing target path
		rm -rf "$item_target_path"
		echo -e "${ORANGE}Warning:${NC} Removed existing target path '$item_target_path'."
	fi

	# Create symbolic link
	ln -s "$item_source_path" "$item_target_path"

	# Check if linking was successful
	if [ $? -eq 0 ]; then
		echo -e "Linking of ${GREEN}$item_name${NC} successful"
	else
		echo -e "Linking of ${RED}$item_name${NC} failed."
	fi
}

# TODO: Maybe retire this shell scirpt by GNU stow?

# Insert home config below to link
# TODO: This is no needed since zinit will use pure theme
link_home_config "dircolors" ".dircolors"
# TODO: I am tired of config bash and zsh at the same time?
# Maybe completely go for zsh?
link_home_config "shell" ".shell"
link_home_config "zshrc" ".zshrc"
link_home_config "bashrc" ".bashrc"

# Insert xdg config below to link
link_xdg_config "nvim"
link_xdg_config "neofetch"
link_xdg_config "kitty"
link_xdg_config "starship.toml"
