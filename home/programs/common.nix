{
  lib,
  pkgs,
  catppuccin-bat,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip
    gnutar

    # utils
    htop

    # misc
    xdg-utils

    # cloud native
    docker-compose
    kubectl
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      extraConfig = "set -g mouse on";
    };

    eza.enable = true; # A modern replacement for `ls`
    ssh.enable = true;
  };
}
