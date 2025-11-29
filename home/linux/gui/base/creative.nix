{pkgs-stable, ...}: {
  home.packages = with pkgs-stable; [
    # creative
    gimp # image editing
    inkscape # vector graphics
  ];
}
