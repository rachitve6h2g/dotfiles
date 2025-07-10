AddPackage brightnessctl           # Lightweight brightness control tool
AddPackage chezmoi                 # Manage your dotfiles across multiple machines
AddPackage cliphist                # wayland clipboard manager
AddPackage emacs-wayland           # The extensible, customizable, self-documenting real-time display editor with PGTK enabled
AddPackage eza                     # A modern replacement for ls (community fork of exa)
AddPackage fuzzel                  # Application launcher for wlroots based Wayland compositors
AddPackage fzf                     # Command-line fuzzy finder
AddPackage git                     # the fast distributed version control system
AddPackage gst-plugin-pipewire     # Multimedia graph framework - pipewire plugin
AddPackage jq                      # Command-line JSON processor
AddPackage kitty                   # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage lazygit                 # Simple terminal UI for git commands
AddPackage less                    # A terminal based program for viewing text files
AddPackage libpulse                # A featureful, general-purpose sound server (client library)
AddPackage mako                    # Lightweight notification daemon for Wayland
AddPackage man-db                  # A utility for reading man pages
AddPackage mediainfo               # Supplies technical and tag information about media files (CLI interface)
AddPackage mpv                     # a free, open source, and cross-platform media player
AddPackage neovim                  # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage niri                    # A scrollable-tiling Wayland compositor
AddPackage openssh                 # SSH protocol implementation for remote login, command execution and file transfer
AddPackage pipewire                # Low-latency audio/video router and processor
AddPackage pipewire-alsa           # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-jack           # Low-latency audio/video router and processor - JACK replacement
AddPackage pipewire-pulse          # Low-latency audio/video router and processor - PulseAudio replacement
AddPackage polkit-gnome            # Legacy polkit authentication agent for GNOME
AddPackage python-mutagen          # An audio metadata tag reader and writer (python library)
AddPackage ripgrep-all             # rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc.
AddPackage rsync                   # A fast and versatile file copying tool for remote and local files
AddPackage starship                # The cross-shell prompt for astronauts
AddPackage swaybg                  # Wallpaper tool for Wayland compositors
AddPackage swayidle                # Idle management daemon for Wayland
AddPackage trash-cli               # Command line trashcan (recycle bin) interface
AddPackage ttf-jetbrains-mono-nerd # Patched font JetBrains Mono from nerd fonts library
AddPackage upower                  # Abstraction for enumerating power devices, listening to device events and querying history and statistics
AddPackage uwsm                    # A standalone Wayland session manager
AddPackage vim                     # Vi Improved, a highly configurable, improved version of the vi text editor
AddPackage vivid                   # LS_COLORS manager with multiple themes
AddPackage waybar                  # Highly customizable Wayland bar for Sway and Wlroots based compositors
AddPackage wireplumber             # Session / policy manager implementation for PipeWire
AddPackage wl-clipboard            # Command-line copy/paste utilities for Wayland
AddPackage wlsunset                # Day/night gamma adjustments for Wayland compositors
AddPackage xdg-utils               # Command line tools that assist applications with a variety of desktop integration tasks
AddPackage yazi                    # Blazing fast terminal file manager written in Rust, based on async I/O
AddPackage yt-dlp                  # A youtube-dl fork with additional features and fixes
AddPackage zoxide                  # A smarter cd command for your terminal

AddPackage --foreign app2unit-git      # Utility to launch commands as systemd user units
AddPackage --foreign paru              # Feature packed AUR helper
AddPackage --foreign paru-debug        # Detached debugging symbols for paru
AddPackage --foreign poweralertd       # UPower-powered power alerter
AddPackage --foreign swaylock-effects  # A fancier screen locker for Wayland.
AddPackage --foreign xdg-terminal-exec # Proposed standard to launching desktop apps with Terminal=true
AddPackage --foreign zen-browser-bin   # Performance oriented Firefox-based web browser

CopyFile /etc/UPower/UPower.conf
