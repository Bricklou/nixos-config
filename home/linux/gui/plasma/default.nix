{mylib, ...}: {
  imports = mylib.scanPaths ./.;

  qt = {
    enable = true;
    platformTheme = {
      name = "kvantum";
    };
    style = {
      name = "kvantum";
    };
  };
}
