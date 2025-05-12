{...}: {
  programs.vscode = {
    enable = true;
    # let vscode sync and update its configurations & extensions across devices, using github account
    profiles.default.userSettings = {};
    profiles.web.userSettings = {};
    profiles.ALE.userSettings = {};
  };
}
