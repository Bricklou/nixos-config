{pkgs, ...}: {
  home.packages = with pkgs; [
    # Misc
    gnupg

    # Interactively filter its input using fuzzy searching, not limited to filenames.
    fzf
    # search for files by name, faster that find
    fd
    # search for files by its content, replacement of grep
    (ripgrep.override {withPCRE2 = true;})

    go-task # a command runner
    lazygit # Git terminal GUI

    htop

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
  ];

  programs = {
    # A modern replacement for `ls`
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "auto";
      extraOptions = ["--group"];
    };

    # a command-line fuzzy finder
    fzf = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };
  };
}
