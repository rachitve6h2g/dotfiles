#!/usr/bin/env bash

set -euo pipefail

if ! command -v git &>/dev/null; then
  echo "git command not found. Please install git."
  exit 1
fi

REPO_URL="https://github.com/rose-pine/gtk.git"
SUBDIR="RosePineGTK"
DOWNLOAD_DIR="${HOME}/Downloads/Git/Packages/${SUBDIR}"
THEME_NAME="rose-pine-gtk"
DEST_DIR="${HOME}/.local/share/themes/${THEME_NAME}"

ICON_THEME="rose-pine-icons"
ICONS_DIR="${HOME}/.local/share/icons/${ICON_THEME}"

if [ ! -d "${DOWNLOAD_DIR}" ]; then
  mkdir -p "$(dirname "$DOWNLOAD_DIR")"
  git clone --depth=1 "$REPO_URL" "$DOWNLOAD_DIR"
else
  echo "Directory already exists."
fi

mkdir -p "$(dirname "$DEST_DIR")"
ln -sfnT "${DOWNLOAD_DIR}/gtk3/${THEME_NAME}" "$DEST_DIR"

mkdir -p "$(dirname "$ICONS_DIR")"
ln -sfnT "${DOWNLOAD_DIR}/icons/${ICON_THEME}" "$ICONS_DIR"

# GTK4_DIR="${HOME}/.config/gtk-4.0"
#
# if [[ ! -d "$GTK4_DIR" ]]; then
#   mkdir -p "$(dirname "$GTK4_DIR")"
#   touch
# fi

GTK4_SRC="${DOWNLOAD_DIR}/gtk4/rose-pine.css"
GTK4_DEST_DIR="${HOME}/.config/gtk-4.0"
GTK4_DEST="${GTK4_DEST_DIR}/gtk.css"

# Ensure the destination directory exists
mkdir -p "$GTK4_DEST_DIR"

# If gtk.css already exists, remove it (only if it's not already correct)
if [ -e "$GTK4_DEST" ] || [ -L "$GTK4_DEST" ]; then
  CURRENT_LINK="$(readlink -- "$GTK4_DEST" || true)"
  if [ "$CURRENT_LINK" != "$GTK4_SRC" ]; then
    rm -f "$GTK4_DEST"
    ln -s "$GTK4_SRC" "$GTK4_DEST"
    echo "Updated gtk.css symlink."
  else
    echo "gtk.css already correctly linked."
  fi
else
  ln -s "$GTK4_SRC" "$GTK4_DEST"
  echo "Created gtk.css symlink."
fi
