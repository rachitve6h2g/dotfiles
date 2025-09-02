#!/bin/bash

set -euo pipefail

THEME_SRC_NAME="Gruvbox-GTK-Theme"
GIT_URI="https://github.com/Fausto-Korpsvart/${THEME_SRC_NAME}.git"
DOWNLOAD_ROOT="$HOME/Downloads/Git/Packages"
DOWNLOAD_DIR="$DOWNLOAD_ROOT/$THEME_SRC_NAME"
INSTALL_DIR="$HOME/.local/share/themes"

# Function to check if a command exists
check_command() {
    local cmd=$1
    if ! command -v "$cmd" &>/dev/null; then
        echo "$cmd is not installed. Please install it first."
        exit 1
    fi
}

# Check for required commands
check_command git
check_command sassc

# Install the theme using the install script
install_theme() {
    echo "Running install.sh to set up theme..."
    if ./install.sh --dest "$INSTALL_DIR" -t yellow -c dark -l --tweaks macos; then
        echo "Theme installed successfully."
    else
        echo "Installation failed. Please check the flags passed to install.sh."
        exit 1
    fi
}

# Clone the repository
clone_repo() {
    if ! git clone --depth=1 "$GIT_URI" "$DOWNLOAD_DIR"; then
        echo "Git clone failed. Please check your network connection."
        exit 1
    fi
}

# Update repository (git pull)
update_repo() {
    echo "Repository already exists, pulling latest changes..."
    cd "$DOWNLOAD_DIR"
    git pull
}

# Main script flow
mkdir -p "$DOWNLOAD_ROOT"

# Check if theme repo exists, clone or update as needed
if [[ ! -d "$DOWNLOAD_DIR" || ! -d "$DOWNLOAD_DIR/.git" ]]; then
    clone_repo
else
    update_repo
fi

# Check if the theme is already installed
if [[ ! -d "$INSTALL_DIR/Gruvbox-Dark" ]]; then
    # If the theme is not installed, install it
    echo "Installing theme..."
    cd "$DOWNLOAD_DIR/themes" || { echo "Themes directory not found."; exit 1; }
    install_theme
else
    echo "Theme already exists, skipping installation."
fi

