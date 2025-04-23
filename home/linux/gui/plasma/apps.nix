{...}: {
  programs.vscode = {
    enable = true;
    # let vscode sync and update its configurations & extensions across devices, using github account
    profiles.default.userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
