_: {
  programs.git = {
    includes = [
      {
        path = "~/Documents/rainbow/.gitconfig";
        condition = "gitdir:~/Documents/rainbow/";
      }
    ];
  };

  modules.dev-tools = {
    enable = true;

    http-client = true;
  };
}
