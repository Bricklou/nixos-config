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
        (lib.optionals config.modules.dev-tools.vscode [pkgs.vscode-fhs pkgs.vscode-runner])
        (lib.optionals config.modules.dev-tools.idea [pkgs-stable.jetbrains.idea-oss])
        (lib.optionals config.modules.dev-tools.pycharm [pkgs-stable.jetbrains.pycharm-community])
        (lib.optionals config.modules.dev-tools.rider [pkgs-stable.jetbrains.rider])
        # HTTP Client
        (lib.optionals config.modules.dev-tools.http-client [pkgs.hoppscotch pkgs.insomnia])

        # Log client
        (lib.optionals config.modules.dev-tools.logs-viewer [pkgs.glogg])
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
    idea = lib.mkEnableOption "install IntelliJ IDEA Community Edition";
    pycharm = lib.mkEnableOption "install PyCharm Community Edition";
    rider = lib.mkEnableOption "install JetBrains Rider IDE";

    http-client = lib.mkEnableOption "install HTTP client tools";

    logs-viewer = lib.mkEnableOption "install log viewer tools";
  };
}
