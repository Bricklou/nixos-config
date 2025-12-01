{
  pkgs,
  pkgs-stable,
  ...
}: {
  environment.systemPackages = with pkgs-stable; [
    vial
    qmk
    qmk-udev-rules
  ];
  services.udev.packages = with pkgs-stable; [
    vial
  ];

  hardware.keyboard.qmk.enable = true;

  services.hardware.openrgb = {
    enable = true;
    package = pkgs-stable.openrgb;
  };
}
