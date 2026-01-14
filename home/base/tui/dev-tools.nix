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

    # package manager
    uv

    # db related
    pgcli
    sqlite

    # ssh related
    sshuttle

    # nodejs version managed
    fnm

    devenv
    inotify-info
    dbeaver-bin

    (with dotnetCorePackages;
      combinePackages [
        sdk_10_0
        runtime_10_0

        sdk_8_0-bin
        runtime_8_0-bin
      ])
  ];

  xdg.configFile."fish/conf.d/fnm.fish".text = ''
    fnm env --use-on-cd --corepack-enabled --resolve-engines --shell fish | source
  '';
  xdg.configFile."fish/conf.d/pnpm.fish".text = ''
    set -Ux PNPM_HOME $HOME/.local/share/pnpm
    set -Ua fish_user_paths $PNPM_HOME
  '';

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;

      enableBashIntegration = true;
    };
  };
}
