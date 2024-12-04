{pkgs, ...}: {
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;

    # TODO: add starship theme
  };
}
