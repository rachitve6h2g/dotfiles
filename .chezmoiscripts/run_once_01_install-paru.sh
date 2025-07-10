#!/bin/bash
set -euo pipefail

DOWNLOAD_LINK="https://aur.archlinux.org/paru.git"
DEST_DIR="$HOME/Downloads/Git/Paru"

if command -v paru &>/dev/null; then
  echo "Paru already installed."
fi

if [[ -d $DEST_DIR ]]; then
  echo "directory exists"
  exit
fi

mkdir -p "$DEST_DIR"
git clone "$DOWNLOAD_LINK" "$DEST_DIR"

cd "$DEST_DIR"

makepkg -si
