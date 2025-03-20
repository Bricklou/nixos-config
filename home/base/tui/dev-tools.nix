{pkgs, ...}: {
  ############################################################
  #
  # Basic settings for development environment
  #
  # Please avoid install language specific packages here (globally)
  # instead, install them:
  #	1. per IDE, such as `programs.neovim.extraPackages`
  #	2. per-project, using https://github.com/the-nix-way/dev-templates
  #
  ############################################################

  home.packages = with pkgs; [
    colmena # nixos's remote deployment tool

    # db related
    pgcli
    sqlite

    # ssh related
    sshuttle

    # nodejs version managed
    fnm

    devenv
  ];

  xdg.configFile."fish/conf.d/fnm.fish".text = ''
    fnm env --use-on-cd --corepack-enabled --resolve-engines --shell fish | source
  '';

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;

      enableBashIntegration = true;
    };
  };

  nix.settings = {
    substituters = ["https://devenv.cachix.org"];
    trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
    trusted-users = ["root" "louis"];
  };
}
