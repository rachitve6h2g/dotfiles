#!/bin/bash

set -euo pipefail

DESTDIR="$HOME/.local/share/chezmoi/gentoo_config"
PORTAGE_DIR="/etc/portage"

PORTAGE_SETTINGS="$DESTDIR/portage"
linux_firmware_savedconfig="$PORTAGE_SETTINGS/savedconfig/sys-kernel"
env_portage="$PORTAGE_SETTINGS/env"

echo "Copying portage settings..."

mkdir -p "$PORTAGE_SETTINGS"

echo "Copying make.conf"
cp "$PORTAGE_DIR/make.conf" "$PORTAGE_SETTINGS"

echo "Copying package.* stuff"
cp "$PORTAGE_DIR"/package.* "$PORTAGE_SETTINGS"

echo "Copying linux-firmware savedconfig file"
mkdir -p "$linux_firmware_savedconfig"

cp "$PORTAGE_DIR/savedconfig/sys-kernel/linux-firmware" "$linux_firmware_savedconfig"

echo "Copying env files"
mkdir -p "$env_portage"
cp "$PORTAGE_DIR"/env/* "$env_portage"

echo "Done"

echo "Copying kernel config"
kernel_config_dest="$DESTDIR/kernel"
kernel_config_src="/etc/kernel/config.d"

mkdir -p "$kernel_config_dest"

cp -r "$kernel_config_src" "$kernel_config_dest"

echo "copied kernel config"

echo "Copying the world set"
cp /var/lib/portage/world "$DESTDIR"
