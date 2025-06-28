#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git"
SUBDIR="Catppuccin-GTK"
DOWNLOAD_DIR="${HOME}/Downloads/Git/Packages/${SUBDIR}"
# DEST_DIR="${HOME}/.local/share/themes/${THEME_NAME}"

if [[ ! -d "${DOWNLOAD_DIR}" ]]; then
	mkdir -p "$(dirname "$DOWNLOAD_DIR")"
	git clone --depth=1 "$REPO_URL" "$DOWNLOAD_DIR"
else
	echo "Directory already exists."
	if [[ -d "$DOWNLOAD_DIR/.git" ]]; then
		echo "Repository already cloned, pulling latest changes..."
		git -C "$DOWNLOAD_DIR" pull
	else
		echo "This is no longer a repo. Please re-clone"
	fi
fi

if [[ -f "${DOWNLOAD_DIR}/themes/install.sh" ]]; then
	echo "Let's install catppuccin gtk theme"
	$DOWNLOAD_DIR/themes/install.sh --dest ${HOME}/.local/share/themes \
		--theme purple \
		--color dark \
		--libadwaita \
		--tweaks macos
else
	echo "Installer script has been removed"
	exit 1
fi
