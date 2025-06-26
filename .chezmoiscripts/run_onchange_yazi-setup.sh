#!/usr/bin/env bash

set -euo pipefail

# CONFIG
YAZI_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/yazi"
PLUGINS=(
  "Rolv-Apneseth/bypass"
  "yazi-rs/plugins:full-border"
  "yazi-rs/plugins:git"
  "boydaihungst/mediainfo"
)

FLAVOR_REPO_OWNER="rachitve6h2g"
FLAVOR_REPO="rose-pine-yazi"
FLAVOR_NAME="rose-pine-main"
FLAVOR="rachitve6h2g/rose-pine-yazi:rose-pine-main"
FLAVOR_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/yazi/flavors/${FLAVOR_NAME}.yazi"

# Ensure that 'ya' is available.
if ! command -v ya &>/dev/null; then
  echo "❌ 'ya' command not found. Install Yazi first." >&2
  exit 1
fi

# Create config dir if needed
mkdir -p "$YAZI_CONFIG"

# Setup plugins
echo "📦 Installing Yazi plugins..."
for plugin in "${PLUGINS[@]}"; do
  ya pack -a "$plugin" || echo "⚠️ Plugin $plugin may already exist."
done

# Setup flavor
if [ ! -d "${FLAVOR_DIR}" ]; then
  echo "🎨 Installing Yazi flavor: $FLAVOR"
  ya pack -a "$FLAVOR"
else
  echo "Theme already installed"
fi

# Create theme.toml if missing
THEME_FILE="$YAZI_CONFIG/theme.toml"
if [ ! -f "$THEME_FILE" ]; then
  cat <<EOF >"$THEME_FILE"
[flavor]
dark = "${FLAVOR_NAME}"
light = "${FLAVOR_NAME}"
EOF
  echo "📝 Created $THEME_FILE"
else
  echo "✅ theme.toml already exists — not overwriting."
fi

echo "✅ Yazi setup complete."
