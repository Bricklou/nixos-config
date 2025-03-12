# https://github.com/fufexan/dotfiles/blob/483680e/system/programs/steam.nix
{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.desktop.gaming {
    # https://wiki.archlinux.org/title/steam
    # Games installed by Steam works fine on NixOS, no other configuration needed
    programs.steam = {
      # Some location that should be persistent:
      #	~/.local/share/Steam - The default Steam install location
      #	~/.local/share/Steam/steamapps/common - The default Game install location
      #	~/.steam/root - A symlink to ~/.local/share/Steam
      #	~/.steam - Some Symlinks & user info
      enable = true;
      # https://github.com/ValeSoftware/gamescope
      gamescopeSession.enable = true;

      # fix gamescope inside steam
      package = pkgs.steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            libkrb5
            keyutils

            # fix fonts
            source-sans
            source-serif

            # audio
            pipewire

            # other common
            udev
            alsa-lib
            vulkan-loader
            xorg.libX11
            xorg.libXcursor
            xorg.libXi
            xorg.libXrandr #To use the x11 feature
            libxkbcommon
            wayland # To use the wayland feature
          ];
      };
    };
  };
}
