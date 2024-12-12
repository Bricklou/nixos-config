{
  mylib,
  catppuccin,
  system,
  ...
}: {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      catppuccin.nixosModules.catppuccin
    ];

  # Enable catppuccin globally
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };
}
