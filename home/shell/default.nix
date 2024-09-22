{ config, ... }: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./fish-shell
    ./common.nix
    ./starship.nix
  ];

  # add environment variables
  home.sessionVariables = {
    # set editor applications
    EDITOR = "nvim";
  };
}
