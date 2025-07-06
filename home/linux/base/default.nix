{
  mylib,
  catppuccin,
  config,
  pkgs,
  lib,
  ...
}: let
  # Create a custom overlay for the catppuccin process-compose theme
  catppuccin-process-compose-theme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/process-compose/refs/heads/main/themes/catppuccin-mocha.yaml";
    sha256 = "01h6ss8wf10ayii4fgb7fw41kpi2ai3r2y0vznk57gf6ggllg65y";
  };
in {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      catppuccin.homeModules.catppuccin
    ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = lib.mkDefault "mauve";

    starship.enable = true;
    lazygit.enable = true;
    fzf.enable = true;
    k9s.enable = true;
    kitty.enable = true;
    gtk.enable = true;
    vesktop.enable = true;
    vscode = {
      profiles.default.enable = false;
    };
    mako.enable = false;
    kvantum.enable = false;
  };

  xdg.configFile."process-compose/theme.yaml".source = catppuccin-process-compose-theme;
}
