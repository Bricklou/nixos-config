{pkgs, ...}: {
  home.packages = with pkgs; [
    # IDEs
    # jetbrains.pycharm-community-bin
    jetbrains.idea-ultimate
    vscode
    vscode-runner

    # HTTP Client
    hoppscotch
    insomnia
  ];
}
