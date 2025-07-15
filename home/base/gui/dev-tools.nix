{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = with pkgs; [
    # IDEs
    # jetbrains.pycharm-community-bin
    pkgs-stable.jetbrains.idea-ultimate
    vscode
    vscode-runner

    # HTTP Client
    hoppscotch
    insomnia
  ];
}
