{ pkgs, ... }: let 
  rmpc_notify = pkgs.writeShellScriptBin "rmpc_notify" ''
    ${builtins.readFile ./notify}
  '';
  rmpc_playcount = pkgs.writeShellScriptBin "rmpc_playcount" ''
    ${builtins.readFile ./playcount}
  '';
  rmpc_lyrics = pkgs.writeShellScriptBin "rmpc_lyrics" ''
    ${builtins.readFile ./lyrics}
  '';
in
{
  imports = [
    ./rmpc_theme.nix
  ];

  programs = {
    rmpc = {
      enable = true;
      config =
        #ron
        ''
          #![enable(implicit_some)]
          #![enable(unwrap_newtypes)]
          #![enable(unwrap_variant_newtypes)]
          (
              address: "/tmp/mpd_socket",
              password: None,
              theme: "theme",
              cache_dir: "/tmp/rmpc/cache",
              lyrics_dir: "~/Music",
              on_song_change: ["${rmpc_notify}/bin/rmpc_notify", "${rmpc_playcount}/bin/rmpc_playcount", "${rmpc_lyrics}/bin/rmpc_lyrics"],
              volume_step: 5,
              max_fps: 30,
              scrolloff: 0,
              wrap_navigation: false,
              enable_mouse: true,
              enable_config_hot_reload: true,
              status_update_interval_ms: 1000,
              rewind_to_start_sec: None,
              reflect_changes_to_playlist: false,
              select_current_song_on_change: false,
              browser_song_sort: [Disc, Track, Artist, Title],
              directories_sort: SortFormat(group_by_type: true, reverse: false),
              album_art: (
                  method: Auto,
                  max_size_px: (width: 1200, height: 1200),
                  disabled_protocols: ["http://", "https://"],
                  vertical_align: Center,
                  horizontal_align: Center,
              ),
              keybinds: (
                  global: {
                      ":":       CommandMode,
                      ",":       VolumeDown,
                      "s":       Stop,
                      ".":       VolumeUp,
                      "<Tab>":   NextTab,
                      "<S-Tab>": PreviousTab,
                      "1":       SwitchToTab("Queue"),
                      "2":       SwitchToTab("Directories"),
                      "3":       SwitchToTab("Artists"),
                      "4":       SwitchToTab("Album Artists"),
                      "5":       SwitchToTab("Albums"),
                      "6":       SwitchToTab("Playlists"),
                      "7":       SwitchToTab("Search"),
                      "q":       Quit,
                      ">":       NextTrack,
                      "p":       TogglePause,
                      "<":       PreviousTrack,
                      "f":       SeekForward,
                      "z":       ToggleRepeat,
                      "x":       ToggleRandom,
                      "c":       ToggleConsume,
                      "v":       ToggleSingle,
                      "b":       SeekBack,
                      "~":       ShowHelp,
                      "u":       Update,
                      "U":       Rescan,
                      "I":       ShowCurrentSongInfo,
                      "O":       ShowOutputs,
                      "P":       ShowDecoders,
                      "R":       AddRandom,
                  },
                  navigation: {
                      "k":         Up,
                      "j":         Down,
                      "h":         Left,
                      "l":         Right,
                      "<Up>":      Up,
                      "<Down>":    Down,
                      "<Left>":    Left,
                      "<Right>":   Right,
                      "<C-k>":     PaneUp,
                      "<C-j>":     PaneDown,
                      "<C-h>":     PaneLeft,
                      "<C-l>":     PaneRight,
                      "<C-u>":     UpHalf,
                      "N":         PreviousResult,
                      "a":         Add,
                      "A":         AddAll,
                      "r":         Rename,
                      "n":         NextResult,
                      "g":         Top,
                      "<Space>":   Select,
                      "<C-Space>": InvertSelection,
                      "G":         Bottom,
                      "<CR>":      Confirm,
                      "i":         FocusInput,
                      "J":         MoveDown,
                      "<C-d>":     DownHalf,
                      "/":         EnterSearch,
                      "<C-c>":     Close,
                      "<Esc>":     Close,
                      "K":         MoveUp,
                      "D":         Delete,
                      "B":         ShowInfo,
                  },
                  queue: {
                      "D":       DeleteAll,
                      "<CR>":    Play,
                      "<C-s>":   Save,
                      "a":       AddToPlaylist,
                      "d":       Delete,
                      "C":       JumpToCurrent,
                      "X":       Shuffle,
                  },
              ),
              search: (
                  case_sensitive: false,
                  mode: Contains,
                  tags: [
                      (value: "any",         label: "Any Tag"),
                      (value: "artist",      label: "Artist"),
                      (value: "album",       label: "Album"),
                      (value: "albumartist", label: "Album Artist"),
                      (value: "title",       label: "Title"),
                      (value: "filename",    label: "Filename"),
                      (value: "genre",       label: "Genre"),
                  ],
              ),
              artists: (
                  album_display_mode: SplitByDate,
                  album_sort_by: Date,
              ),
              tabs: [
              (
                  name: "Queue",
                  pane: Split(
                      direction: Vertical,
                      panes: [
                          (
                              size: "100%",
                              borders: "NONE",
                              pane: Split(
                                  borders: "NONE",
                                  direction: Horizontal,
                                  panes: [
                                      (
                                          size: "70%",
                                          borders: "ALL",
                                          pane: Pane(Queue),
                                      ),
                                      (
                                          size: "30%",
                                          borders: "NONE",
                                          pane: Split(
                                              direction: Vertical,
                                              panes: [
                                                  (
                                                      size: "75%",
                                                      borders: "ALL",
                                                      pane: Pane(AlbumArt),
                                                  ),
                                                  (
                                                      size: "25%",
                                                      borders: "NONE",
                                                      pane: Split(
                                                          direction: Vertical,
                                                          panes: [
                                                              (
                                                                  size: "100%",
                                                                  pane: Pane(Lyrics),
                                                              ),
                                                          ]
                                                      ),
                                                  ),
                                              ]
                                          ),
                                      ),
                                  ]
                              ),
                          ),
                      ],
                  ),
              ),
              (
                  name: "Directories",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(Directories))],
                  ),
              ),
              (
                  name: "Artists",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(Artists))],
                  ),
              ),
              (
                  name: "Album Artists",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(AlbumArtists))],
                  ),
              ),
              (
                  name: "Albums",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(Albums))],
                  ),
              ),
              (
                  name: "Playlists",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(Playlists))],
                  ),
              ),
              (
                  name: "Search",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(Search))],
                  ),
              ),
              (
                  name: "Browser",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(Browser(root_tag: "Artist")))],
                  ),
              ),
              (
                  name: "Lyrics",
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "100%", borders: "ALL", pane: Pane(Lyrics))],
                  ),
              ),
              ],
          )
        '';
    };
  };

  # xdg.configFile = {
  #   "rmpc/notify" = {
  #     source = ./rmpc/notify;
  #     executable = true;
  #   };
  #   "rmpc/playcount" = {
  #     source = ./rmpc/playcount;
  #     executable = true;
  #   };
  #   "rmpc/lyrics" = {
  #     source = ./rmpc/lyrics;
  #     executable = true;
  #   };
  # };
}
