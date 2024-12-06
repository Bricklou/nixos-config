{pkgs, ...}: {
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    catppuccin.enable = true;
  };
}
