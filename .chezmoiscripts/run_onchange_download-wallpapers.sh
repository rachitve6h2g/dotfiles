#!/usr/bin/env bash
set -euo pipefail

# Config
WALL_DIR="$HOME/Pictures/Wallpapers"
mkdir -p "$WALL_DIR"

# Wallpapers: [URL] => [nice filename]
wallpapers=(
  "https://github.com/fr0st-iwnl/wallz/blob/main/Catppuccin%20Mocha/20.%20Catppuccin%20Mocha.jpg?raw=true|catppuccin-20.jpg"
  "https://github.com/fr0st-iwnl/wallz/blob/main/Catppuccin%20Mocha/13.%20Catppuccin%20Mocha.png?raw=true|catppuccin-13.png"
  "https://github.com/fr0st-iwnl/wallz/blob/main/Ros%C3%A9%20Pine/01.%20Ros%C3%A9%20Pine.jpeg?raw=true|rosepine-01.jpeg"
  "https://github.com/fr0st-iwnl/wallz/blob/main/Ros%C3%A9%20Pine/11.%20Ros%C3%A9%20Pine.jpg?raw=true|rosepine-11.jpg"
  "https://github.com/fr0st-iwnl/wallz/blob/main/Ros%C3%A9%20Pine/18.%20Ros%C3%A9%20Pine.jpeg?raw=true|rosepine-18.jpeg"
  "https://github.com/fr0st-iwnl/wallz/blob/main/Catppuccin%20Mocha/10.%20Catppuccin%20Mocha.png?raw=true|catppuccin-10.png"
  "https://github.com/fr0st-iwnl/wallz/blob/main/Catppuccin%20Mocha/34.%20Catppuccin%20Mocha.png?raw=true|catppuccin-20.png"
)

# Download loop
for entry in "${wallpapers[@]}"; do
  IFS="|" read -r url filename <<<"$entry"
  dest="$WALL_DIR/$filename"

  if [[ -f "$dest" ]]; then
    echo "✔️  Skipping $filename (already exists)"
  else
    echo "⬇️  Downloading $filename..."
    curl -fsSL "$url" -o "$dest"
  fi
done

echo "✅ All wallpapers are saved in $WALL_DIR."
