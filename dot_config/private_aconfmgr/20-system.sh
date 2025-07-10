AddPackage aria2           # For downloading essential stuff and also pacman.conf
AddPackage base            # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel      # Basic tools to build Arch Linux packages
AddPackage bash-completion # Programmable completion for the bash shell
AddPackage btrfs-progs     # For creation of initramfs
AddPackage intel-ucode
AddPackage iwd
AddPackage efibootmgr
AddPackage linux
AddPackage linux-firmware-intel
AddPackage linux-firmware-realtek
AddPackage linux-firmware-others
AddPackage linux-firmware-whence
AddPackage reflector
AddPackage zram-generator

AddPackage --foreign aconfmgr-git
AddPackage --foreign paccache-hook

CopyFile /etc/pacman.conf
CopyFile /etc/sudoers.d/00_krish 440
CopyFile /etc/sudoers

CopyFile /etc/makepkg.conf
CopyFile /etc/mkinitcpio.conf

CreateLink /etc/resolv.conf /run/systemd/resolve/stub-resolv.conf

CopyFile /etc/vconsole.conf

CreateLink /usr/bin/vi /usr/bin/vim

CopyFile /etc/xdg/reflector/reflector.conf

# Creation of timezone
CreateLink /etc/localtime /usr/share/zoneinfo/Asia/Kolkata
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
