{
  mylib,
  catppuccin,
  ...
}: {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      catppuccin.homeManagerModules.catppuccin
    ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };
}
