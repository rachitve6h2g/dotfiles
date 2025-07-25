{ pkgs, lib, ... }:
let
  myAliases = {
    gocon = "cd $HOME/.nixdots";

    # Get image on the fly.
    kitcat = "${pkgs.kitty}/bin/kitten icat";

    # For btop, coz the l18n is set to indian
    btop = "btop --force-utf";
    # Jump to the git source dir.
    cdg = "cd $(git rev-parse --show-toplevel)";

    # For audio downloading
    yt-music = "yt-dlp -x -f bestaudio --audio-format mp3 -o '~/Music/%(artist)s/%(album)s/%(title)s.%(ext)s'";

    ".." = "cd ..";
    ffetch = "${pkgs.fastfetch}/bin/fastfetch";

    ec = "emacsclient -c";

    vi = "${pkgs.helix}/bin/hx";
    vim = "${pkgs.helix}/bin/hx";
    oldvim = "myHomeModuleNvim";
  };
in
{
  imports = [ ./eza.nix ];

  home.shell.enableZshIntegration = true;

  programs = {
    # All the shellIntegration options
    kitty.shellIntegration.enableZshIntegration = true;
    zoxide.enableZshIntegration = true;
    yazi.enableZshIntegration = true;
    starship.enableZshIntegration = true;
    nix-index.enableZshIntegration = true;
    fzf.enableZshIntegration = true;
    eza.enableZshIntegration = true;

    zsh = {
      enable = true;
      defaultKeymap = "emacs";

      sessionVariables = {
        # EDITOR = "myHomeModuleNvim";
        MOZ_ENABLE_WAYLAND = 1;
        QT_QPA_PLATFORM = "wayland";
        SUDO_PROMPT = lib.concatStrings [
          "$(tput setaf 1 bold)󰌾 "
          "$(tput sgr0)$(tput setaf 2) password"
          "$(tput sgr0)$(tput setaf 4) for"
          "$(tput sgr0)$(tput setaf 5) %p"
          "$(tput sgr0)$(tput setaf 3):"
        ];
      };

      initContent =
        let
          interactive_functions =
            lib.mkAfter
              # bash
              ''
                rm() { command rm -i "''${@}"; }
                cp() { command cp -i "''${@}"; }
                mv() { command mv -i "''${@}"; }
                trash() { command trash -i "''${@}"; }
              '';

          extract_function =
            lib.mkAfter
              # bash
              ''
                extract() {
                   if [ -f $1 ]; then
                     case $1 in
                     *.tar.bz2) tar xvjf $1 ;;
                     *.tar.gz) tar xvzf $1 ;;
                     *.bz2) bunzip2 $1 ;;
                     *.rar) unrar x $1 ;;
                     *.gz) gunzip $1 ;;
                     *.tar) tar xvf $1 ;;
                     *.tbz2) tar xvjf $1 ;;
                     *.tgz) tar xvzf $1 ;;
                     *.zip) unzip $1 ;;
                     *.Z) uncompress $1 ;;
                     *.7z) 7z x $1 ;;
                     *) echo "don't know how to extract '$1'..." ;;
                     esac
                   else
                     echo "'$1' is not a valid file!"
                   fi
                 }
              '';
          lazy_git_change_dir =
            lib.mkAfter
              # bash
              ''
                lg()
                  {
                      export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

                      lazygit "$@"

                      if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
                              cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
                              rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
                      fi
                  }
              '';
        in
        lib.mkMerge [
          interactive_functions
          extract_function
          lazy_git_change_dir
        ];

      # Don't forget to add
      # environment.pathsToLink = [ "/share/zsh" ];
      # to configuration.nix
      enableCompletion = true;

      autosuggestion = {
        enable = true;
        strategy = [
          "completion"
        ];
      };

      syntaxHighlighting = {
        enable = true;
      };

      dotDir = ".config/zsh";

      # TODO: set up the history attribute

      # Use the home.shellAliases for simple shell aliases.
      # If there are shell specific aliases, use this.
      shellAliases = myAliases;
    };
  };
}
