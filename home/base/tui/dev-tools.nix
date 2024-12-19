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
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;

      enableBashIntegration = true;
    };
  };
}
