source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Would not be needed if using fast-syntax-highlighting with zinit
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# VERY IMPORTANT: remove this and face disaster 
# https://wiki.archlinux.org/title/Zsh #4.5.2
TRAPUSR1() { rehash }
