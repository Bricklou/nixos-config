{
  pkgs,
  config,
  system,
  ...
}: let
  shellAliases = {
    "z" = "open_zellij";
    "zj" = "open_zellij";
    "zellij" = "open_zellij";
  };

  zellijBin = "${pkgs.zellij}/bin/zellij";

  zellij-autolock = pkgs.fetchurl {
    url = "https://github.com/fresh2dev/zellij-autolock/releases/download/0.2.1/zellij-autolock.wasm";
    hash = "sha256-3KvHgNdJdb8Nd83OxxrKFuzM6nAjn0G0wyebOI9zs40=";
  };

  configTemplate = builtins.readFile ./config.kdl;
  # Replace the placeholder with the actual path
  configFile = builtins.replaceStrings ["\${triggers}"] ["${pkgs.neovim-unwrapped}/bin/nvim"] configTemplate;
in {
  programs.zellij = {
    enable = true;
  };
  # auto start zellij in fish shell
  programs.fish.shellInit = ''
    # auto start zellij
    # except when in emacs or zellij itself
    if status --is-interactive
      if not set -q ZELLIJ; and not set -q INSIDE_EMACS; and not set -q VSCODE_STABLE
        if test "$ZELLIJ_AUTO_ATTACH" = "true"
          ${zellijBin} attach -c
        else
          ${zellijBin}
        end

        # Auto exit the shell session when zellij exit
        if test "$ZELLIJ_AUTO_EXIT" = "true"
          kill $fish_pid
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
    end
  '';

  programs.fish.shellAliases = shellAliases;

  # xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  xdg.configFile."zellij/config.kdl".text = configFile;
  xdg.configFile."zellij/plugins/zellij-autolock.wasm".source = zellij-autolock;
}
