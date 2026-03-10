{pkgs, ...}: {
  programs.git = {
    includes = [
      {
        path = "~/Documents/rainbow/.gitconfig";
        condition = "gitdir:~/Documents/rainbow/";
      }
    ];
  };

  home.packages = [pkgs.claude-code];

  modules.dev-tools = {
    enable = true;
    vscode = true;
    idea = true;
    logs-viewer = true;

    http-client = true;
  };
}
