{
  programs.git.settings = {
    user.signingKey = "25209AE7B044285E";
    commit.gpgSign = true;
    tag.gpgSign = true;
  };

  modules.dev-tools = {
    enable = true;
    vscode = true;
    rider = true;

    http-client = true;
  };
}
