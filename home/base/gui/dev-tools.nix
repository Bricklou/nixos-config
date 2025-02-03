{pkgs, ...}: {
  home.packages = with pkgs; [
    # IDEs
    # jetbrains.pycharm-community-bin
    # jetbrains.idea-ultimate

    # HTTP Client
    hoppscotch
  ];
}
