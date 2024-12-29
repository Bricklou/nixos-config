{pkgs, ...}: let
  shellAliases = {
    "zj" = "zellij";
  };
in {
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
  };
  # auto start zellij in fish shell
  programs.fish.shellInit = ''
    # auto start zellij
    # except when in emacs or zellij itself
    if not set -q ZELLIJ and not set -q INSIDE_EMACS
      if set -q ZELLIJ_AUTO_ATTACH and test $ZELLIJ_AUTO_ATTACH = "true"
        zellij attach -c
      else
        zellij
      end

      # Auto exit the shell session when zellij exit
      set -g ZELLIJ_AUTO_EXIT "false" # disable auto exit
      if set -q ZELLIJ_AUTO_EXIT and test $ZELLIJ_AUTO_EXIT = "true"
        exit
      end
    end
  '';

  home.shellAliases = shellAliases;
  programs.fish.shellAliases = shellAliases;

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
