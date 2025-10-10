{
  programs.git.extraConfig = {
    user.signingKey = "25209AE7B044285E";
    commit.gpgSign = true;
    tag.gpgSign = true;
  };

  modules.dev-tools = {
    enable = true;
    vscode = true;

    http-client = true;
  };
}
