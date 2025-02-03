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

    starship.enable = true;
    lazygit.enable = true;
    fzf.enable = true;
    k9s.enable = true;
    kvantum.enable = true;
    kitty.enable = true;
  };
}
