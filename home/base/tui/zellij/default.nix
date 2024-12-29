{pkgs, ...}: let
  shellAliases = {
    "zj" = "open_zellij";
    "zellij" = "open_zellij";
  };

  zellijBin = "${pkgs.zellij}/bin/zellij";
in {
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
  };
  # auto start zellij in fish shell
  programs.fish.shellInit = ''
    # auto start zellij
    # except when in emacs or zellij itself
    if not set -q ZELLIJ; and not set -q INSIDE_EMACS
      if set -q ZELLIJ_AUTO_ATTACH; and test $ZELLIJ_AUTO_ATTACH = "true"
        ${zellijBin} attach -c
      else
        ${zellijBin}
      end

      # Auto exit the shell session when zellij exit
      set -g ZELLIJ_AUTO_EXIT "false" # disable auto exit
      if set -q ZELLIJ_AUTO_EXIT; and test $ZELLIJ_AUTO_EXIT = "true"
        exit
      end
    end


    # this function will check if a zellij session is running
    # and if it is, it will attach to it
    function open_zellij
      set -l argc (count $argv)
      if test $argc -gt 0
        # Arguments are passed, pass them to Zellij
        ${zellijBin} $argv
      else
        if set -q ZELLIJ
          # Inside another Zellij instance, open a new tab
          ${zellijBin} action new-tab
        else
          # Not inside Zellij, open it
          ${zellijBin}
        end
      end
    end
  '';

  home.shellAliases = shellAliases;
  programs.fish.shellAliases = shellAliases;

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
