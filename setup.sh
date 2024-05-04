#!/bin/bash

# Color
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # no color

# Source directory
source_directory=$(pwd)
# Target directory
target_directory="$HOME/.config"

# Function to link folder or file to specified path
link_item() {
	local item_name=$1

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

# Insert items below to link
link_item "nvim"
link_item "neofetch"
link_item "kitty"
link_item "123"
