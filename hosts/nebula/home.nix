_: {
  programs.git = {
    includes = [
      {
        path = "~/Documents/rainbow/.gitconfig";
        condition = "gitdir:~/Documents/rainbow/";
      }
    ];
  };
}
