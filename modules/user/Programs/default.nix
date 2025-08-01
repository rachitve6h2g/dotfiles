{ pkgs, ... }:
{
  imports = [
    ./bottom.nix
    ./btop.nix
    ./fastfetch.nix
    ./imv.nix
    ./newsboat.nix
    ./peaclock.nix
    ./udiskie.nix
    ./yt-dlp.nix
    ./zathura.nix

    ./wgetpaste
    ./yazi
  ];

  # Misc
  home.packages = with pkgs; [
    ansifilter
    bluetui
    figlet
    gthumb
    kdePackages.qtstyleplugin-kvantum
    mediawriter
    nurl # https://github.com/nix-community/nurl
    pavucontrol
    trash-cli
    (uget.override {
      aria2 = pkgs.aria2;
    })
    update-nix-fetchgit
    wgetpaste
  ];

  programs = {
    jq = {
      enable = true;
    };
  };
}
