#!/bin/bash

# Color
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # no color

# Source directory
source_directory=$(pwd)
# Target directory
target_directory="$HOME/.config"

# Function to link folder or file to specified path
link_item() {
	local item_name=$1

	local item_source_path=$source_directory/$item_name
	local item_target_path=$target_directory/$item_name
	# Check if the item exists
	if [ -e "$item_name" ]; then
		# Create symbolic link
		ln -s $item_source_path $item_target_path
		# Check if linking was successful
		if [ $? -eq 0 ]; then
			echo -e "Linking of ${GREEN} "$item_name" ${NC} successful"
		else
			echo -e "Linking of ${RED} "$item_name" ${NC} failed."
		fi
	else
		echo -e "Item ${RED} "$item_name" ${NC} does not exist."
	fi
}

# Inset item below to link
link_item "nvim"
