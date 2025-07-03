#!/usr/bin/env bash

set -euo pipefail

if ! command -v git &>/dev/null; then
  echo "git command not found. Please install git first"
  exit 1
fi

read -p "Enter choice (1 for Catppuccin, 2 for rose-pine, 3 for kanagawa): " choice

case $choice in
1)
  sh ./catppuccin-gtk-install.sh
  ;;
2)
  sh ./rose-pine-gtk-install.sh
  ;;
3)
  sh ./kanagawa-gtk-install.sh
  ;;
*)
  echo "Invalid choice"
  ;;
esac

echo "Please edit ~/.config/gtk-3.0/settings.ini and change the GTK_THEME variable."
