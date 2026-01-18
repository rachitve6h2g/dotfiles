#!/usr/bin/env bash

set -euo pipefail

# Pick downloader
if command -v aria2c &>/dev/null; then
    download_cmd() {
        # $1 = filename, $2 = url
        aria2c -x 4 -s 4 -d "$DEST_DIR" -o "$1" "$2"
    }
elif command -v wget &>/dev/null; then
    download_cmd() {
        wget -O "$DEST_DIR/$1" "$2"
    }
else
    echo "Neither aria2c nor wget is installed. Exiting."
    exit 1
fi

# Wallpapers array: "url|filename"
wallpapers=(
    # "https://raw.githubusercontent.com/rachitve6h2g/Wallpapers/refs/heads/main/platform.jpg|gruvbox-1.jpg"
    "https://github.com/linuxdotexe/nordic-wallpapers/blob/master/wallpapers/ign_herakles.png?raw=true|herakles.png"
)

# Destination directory
DEST_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}/Wallpapers"
mkdir -p "$DEST_DIR"

# Download loop
for entry in "${wallpapers[@]}"; do
    url="${entry%%|*}"        # left of |
    filename="${entry##*|}"   # right of |
    filepath="$DEST_DIR/$filename"

    if [[ -f "$filepath" ]]; then
        echo "Already exists: $filename → skipping."
    else
        echo "Downloading: $filename"
        download_cmd "$filename" "$url"
        echo "Saved to: $filepath"
    fi
done

