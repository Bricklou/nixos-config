{
  pkgs,
  pkgs-stable,
  config,
  lib,
  ...
}: {
  config = {
    home.packages = lib.mkIf config.modules.dev-tools.enable (
      lib.flatten [
        # IDEs
        (lib.optionals config.modules.dev-tools.vscode [pkgs.vscode pkgs.vscode-runner])
        (lib.optionals config.modules.dev-tools.idea [pkgs-stable.jetbrains.idea-ultimate])
        (lib.optionals config.modules.dev-tools.pycharm [pkgs-stable.jetbrains.pycharm-professional])
        # HTTP Client
        (lib.optionals config.modules.dev-tools.http-client [pkgs.hoppscotch pkgs.insomnia])
      ]
    );

    modules.dev-tools = {
      enable = lib.mkDefault false;
      vscode = lib.mkDefault true;
    };
  };

  # Enable dev tools
  options.modules.dev-tools = {
    enable = lib.mkEnableOption "enable development tools";

    vscode = lib.mkEnableOption "install Visual Studio Code";
    idea = lib.mkEnableOption "install IntelliJ IDEA Ultimate Edition";
    pycharm = lib.mkEnableOption "install PyCharm Professional Edition";

    http-client = lib.mkEnableOption "install HTTP client tools";
  };
}
