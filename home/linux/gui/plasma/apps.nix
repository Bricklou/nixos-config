{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = with pkgs; [
    pkgs-stable.python313Packages.kde-material-you-colors
    libreoffice-qt6-fresh
    kdePackages.keditbookmarks
  ];
}
