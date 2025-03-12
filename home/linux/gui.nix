{lib, ...}: {
  imports = [
    ../base/core
    ../base/tui
    ../base/gui
    ../base/home.nix

    ./base
    ./gui
  ];

  # Desktop options
  options.modules.desktop = {
    gaming = lib.mkEnableOption "enable gaming related programs";
  };
}
