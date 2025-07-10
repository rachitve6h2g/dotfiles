#!/bin/bash

set -euo pipefail

echo "Creating Profile \"krish\"."
name="krish"
zen-browser -CreateProfile "$name"
folder=$(sed -n "/Path=.*\.$name$/ s/.*=//p" ~/.zen/profiles.ini)
path="/home/$(whoami)/.zen/$folder"
echo "Profile Creation finished."

CHROME_DIR=$path/chrome

if [[ ! -d $CHROME_DIR ]]; then
  mkdir -p $CHROME_DIR
fi

echo "Downloading rosepine userchrome css into $CHROME_DIR"

downloads=(
  "https://raw.githubusercontent.com/rose-pine/zen-browser/refs/heads/main/dist/rose-pine-main.css"
  "https://raw.githubusercontent.com/rose-pine/zen-browser/refs/heads/main/dist/userChrome.css"
)

for entry in "${downloads[@]}"; do
  IFS="|" read -r url filename <<<"$entry"
  dest="$CHROME_DIR/$filename"

  if [[ -f "$dest" ]]; then
    echo "Skipping $filename (already exists)"
  else
    echo "Downloading $filename..."
    aria2c -o "$filename" --dir="$CHROME_DIR" "$url"
  fi
done

echo "Userstyles downloaded."
