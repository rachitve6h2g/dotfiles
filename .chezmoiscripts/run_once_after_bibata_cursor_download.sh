#!/bin/bash

set -euo pipefail

RELEASE="v2.0.7"
FLAVOR="Modern-Classic"
THEME="Bibata-${FLAVOR}"
TAR="${THEME}.tar.xz"

URI="https://github.com/ful1e5/Bibata_Cursor/releases/download/${RELEASE}/${TAR}"

DOWNLOAD_DIR="$HOME/Downloads"
INSTALL_DIR="$HOME/.local/share/icons"
THEME_SRC="$DOWNLOAD_DIR/$THEME"
TAR_SRC="$DOWNLOAD_DIR/$TAR"

echo "Bibata-${FLAVOR} version: ${RELEASE} is being downloaded in ${DOWNLOAD_DIR}"

install_theme() {
	if [[ ! -d "$INSTALL_DIR/$THEME" ]]; then
		mkdir -p "$INSTALL_DIR"
		cp -r "$THEME_SRC" "$INSTALL_DIR"
		echo "Cursor installed in $INSTALL_DIR"
	else
		echo "Theme is already installed"
		exit 0
	fi
	echo "Removing $THEME_SRC"
	rm -rf "$TAR_SRC"
}

if [[ ! -f "${DOWNLOAD_DIR}/${TAR}" ]]; then
	mkdir -p "${DOWNLOAD_DIR}"
	cd "$DOWNLOAD_DIR"
	aria2c "$URI"
	tar -xvf "$TAR_SRC"
	install_theme
else
	echo "Tar is already downloaded"
	echo "Skipping download"
	install_theme
fi
