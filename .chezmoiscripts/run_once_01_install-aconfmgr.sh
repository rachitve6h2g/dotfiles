#!/bin/bash
set -euo pipefail

DOWNLOAD_LINK="https://aur.archlinux.org/aconfmgr-git.git"
DEST_DIR="$HOME/Downloads/Git/aconfmgr"

if command -v chezmoi &>/dev/null; then
  echo "chezmoi is installed."
else
  echo "chezmoi must be installed"
  exit 1
fi

if [[ -d $DEST_DIR ]]; then
  echo "directory exists"
  exit
fi

if command -v aconfmgr &>/dev/null; then
  echo "aconfmgr already installed."
else
  echo "Cloning aconfmgr-git from aur".
  mkdir -p "$DEST_DIR"
  git clone "$DOWNLOAD_LINK" "$DEST_DIR"

  cd "$DEST_DIR"
  echo "Installing aconfmgr-git."
  makepkg -si
fi

aconfmgr apply
