

# Thursday 10 July 2025 12:03:29 PM IST - Unknown packages


AddPackage btop # A monitor of system resources, bpytop ported to C++
AddPackage chafa # Image-to-text converter supporting a wide range of symbols and palettes, transparency, animations, etc.
AddPackage fastfetch # A feature-rich and performance oriented neofetch like system information tool
AddPackage github-cli # The GitHub CLI
AddPackage imagemagick # An image viewing/manipulation program
AddPackage imv # Image viewer for Wayland and X11
AddPackage linux-firmware-other # Firmware files for Linux - Unsorted firmware for various devices
AddPackage noto-fonts-cjk # Google Noto CJK fonts
AddPackage noto-fonts-emoji # Google Noto Color Emoji font
AddPackage qt6-wayland # Provides APIs for Wayland
AddPackage virtualbox # Powerful x86 virtualization for enterprise as well as home use
AddPackage virtualbox-guest-iso # The official VirtualBox Guest Additions ISO image
AddPackage virtualbox-host-modules-arch # Virtualbox host kernel modules for Arch Kernel
AddPackage xwayland-satellite # Xwayland outside your Wayland
AddPackage zathura # Minimalistic document viewer
AddPackage zathura-cb # Adds comic book support to zathura
AddPackage zathura-pdf-mupdf # PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)


# Thursday 10 July 2025 12:03:29 PM IST - Missing packages


RemovePackage linux-firmware-others


# Thursday 10 July 2025 12:03:29 PM IST - Extra files


RemoveFile /usr/bin/vi
RemoveFile /usr/bin
RemoveFile /usr
RemoveFile /etc/resolv.conf


# Thursday 10 July 2025 12:03:29 PM IST - New / changed files


CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf
CopyFile /etc/hostname
CreateDir /etc/iwd
CopyFile /etc/kernel/cmdline
CreateLink /etc/os-release ../usr/lib/os-release
CreateFile /etc/subgid- > /dev/null
CreateFile /etc/subuid- > /dev/null
