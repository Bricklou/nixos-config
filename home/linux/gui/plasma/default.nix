{mylib, ...}: {
  imports = mylib.scanPaths ./.;

  qt = {
    enable = true;
    platformTheme = {
      name = "Breeze";
    };
    style = {
      name = "Breeze";
    };
  };
}
