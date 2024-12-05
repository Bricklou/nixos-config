{pkgs, ...}: {
  home.packages = with pkgs; [
    # IDEs
    jetbrains.pycharm-community
    jetbrains.idea-ultimate
  ];
}
