{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # GUI apps

    # instant messages
    vesktop
    discord

    # remote desktop (rdp connect)
    remmina
    freerdp # required by remmina

    # misc
    kdePackages.spectacle
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.kdeconnect-kde

    # knownledge base
    obsidian
  ];

  # allow fontconfig to discover fonts and configurations installed through home.packages
  # Install fonts at system-level, not user-level
  fonts.fontconfig.enable = true;

  # kitty terminal
  programs.kitty = lib.mkForce {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = true;
      mouse_hide_wait = "2";
      window_padding_width = 5;
      background_opacity = 0.95;
      background_blur = 3;
      sync_to_monitor = true;
      symbol_map = let
        mappings = [
          "U+23FB-U+23FE"
          "U+2B58"
          "U+E200-U+E2A9"
          "U+E0A0-U+E0A3"
          "U+E0B0-U+E0BF"
          "U+E0C0-U+E0C8"
          "U+E0CC-U+E0CF"
          "U+E0D0-U+E0D2"
          "U+E0D4"
          "U+E700-U+E7C5"
          "U+F000-U+F2E0"
          "U+2665"
          "U+26A1"
          "U+F400-U+F4A8"
          "U+F67C"
          "U+E000-U+E00A"
          "U+F300-U+F313"
          "U+E5FA-U+E62B"
        ];
      in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";

      background = "#151522";
    };
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 11;
    };
    shellIntegration.enableFishIntegration = true;
  };
}
