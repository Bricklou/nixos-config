{pkgs, ...}: {
  home.packages = with pkgs; [
    python313Packages.kde-material-you-colors
  ];
}
