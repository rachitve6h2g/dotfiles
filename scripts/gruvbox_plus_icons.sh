#!/bin/bash

set -euo pipefail
set -x

if ! command -v git &>/dev/null; then
  echo "git not installed"
  echo "Please install git manually: sudo emerge -av git"
  exit 1
fi

URL="https://github.com/SylEleuth/gruvbox-plus-icon-pack.git"
DOWNLOAD_DIR="$HOME/Downloads/Git/Gruvbox-Icons"

if [[ ! -d "$DOWNLOAD_DIR" ]]; then
  mkdir -p "$DOWNLOAD_DIR"
  echo "$DOWNLOAD_DIR created"
else
  echo "Download dir already exists"
fi

if [[ ! -d "$DOWNLOAD_DIR/.git" ]]; then
  if [[ -d "$DOWNLOAD_DIR" && -n $(find "$DOWNLOAD_DIR" -mindepth 1 -print -quit) ]]; then
    echo "Directory exists and is not a Git repo - removing it"
    rm -rf "$DOWNLOAD_DIR"
    mkdir -p "$DOWNLOAD_DIR"
  fi
  echo "cloning git repo"
  git clone --depth=1 "$URL" "$DOWNLOAD_DIR"
  echo "cloned repo"
else
  echo "Git repo already exists. Pulling changes..."
  cd "$DOWNLOAD_DIR"
  if git pull; then
    echo "Pulled latest changes"
  else
    echo "git pull failed"
    exit 1
  fi
fi

POLARITY="Dark" # Or it can be "Light"
ICON="Gruvbox-Plus-$POLARITY"
ICON_SRC="$DOWNLOAD_DIR/$ICON"
ICON_INSTALL_DIR="$HOME/.local/share/icons"
LINK="$ICON_INSTALL_DIR/$ICON"

if [[ -L "$LINK" && "$(readlink "$LINK")" == "$ICON_SRC" ]]; then
  echo "Symlink exists."
  echo "Skipping symlink creation"
else
  echo "now creating/updating symlink (as directed by the git readme)"
  if [[ ! -d "$ICON_INSTALL_DIR" ]]; then
    mkdir -p "$ICON_INSTALL_DIR"
    echo "XDG_DATA_DIR/themes created"
  else
    echo "$ICON_INSTALL_DIR already exists, skipping creation"
  fi
  
  ln -sfn "$ICON_SRC" "$ICON_INSTALL_DIR/"

  echo "Symlink created: $(readlink "$LINK")"
fi
