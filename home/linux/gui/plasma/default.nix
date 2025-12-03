{mylib, ...}: {
  imports = mylib.scanPaths ./.;

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };
}
