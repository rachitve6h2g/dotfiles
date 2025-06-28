#!/usr/bin/env bash

set -euo pipefail

if ! command -v git &>/dev/null; then
	echo "git command not found. Please install git first"
	exit 1
fi

read -p "Enter choice (1 for Catppuccin, 2 for rose-pine): " choice

case $choice in 
	1)
		sh ./catppuccin-gtk-install.sh
		;;
	2)
		sh ./rose-pine-gtk-install.sh
		;;
	*)
		echo "Invalid choice"
		;;
esac
