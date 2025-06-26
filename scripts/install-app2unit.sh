#!/bin/bash

# Define variables
SRC_DIR="$HOME/Downloads/Git/Packages/app2unit"
REPO_URL="https://github.com/Vladimir-csp/app2unit.git"
DEST_DIR="$HOME/.local/bin"

# Create source directory (parent)
mkdir -p "$(dirname "$SRC_DIR")"

# Clone or update the repository
if [ -d "$SRC_DIR/.git" ]; then
  echo "Repository already cloned, pulling latest changes..."
  git -C "$SRC_DIR" pull
else
  echo "Cloning repository..."
  git clone "$REPO_URL" "$SRC_DIR"
fi

# Ensure destination directory exists
mkdir -p "$DEST_DIR"

# Copy script(s) to destination
cp "$SRC_DIR"/app2unit* "$DEST_DIR/"

# Optional: Make sure copied scripts are executable
chmod +x "$DEST_DIR"/app2unit*

echo "Installation complete. Make sure $DEST_DIR is in your PATH."
