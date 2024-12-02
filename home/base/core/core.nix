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
    };

    # a command-line fuzzy finder
    fzf = {
      enable = true;
      # https://github.com/catppuccin/fzf
      # catppuccin-mocha
      colors = {
        "bg+" = "#313244";
        "bg" = "#1e1e2e";
        "spinner" = "#f5e0dc";
        "hl" = "#f38ba8";
        "fg" = "#cdd6f4";
        "header" = "#f38ba8";
        "info" = "#cba6f7";
        "pointer" = "#f5e0dc";
        "marker" = "#f5e0dc";
        "fg+" = "#cdd6f4";
        "prompt" = "#cba6f7";
        "hl+" = "#f38ba8";
      };
    };
  };
}
