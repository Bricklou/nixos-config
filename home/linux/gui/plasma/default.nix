{mylib, ...}: {
  imports = mylib.scanPaths ./.;

  qt = {
    enable = true;
    platformTheme = {
      name = "kvantum";
    };
    style = {
      catppuccin.enable = true;
      name = "kvantum";
    };
  };
}
