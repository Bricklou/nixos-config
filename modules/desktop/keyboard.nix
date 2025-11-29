{
  pkgs,
  pkgs-stable,
  ...
}: {
  environment.systemPackages = with pkgs-stable; [
    via
    vial
    qmk
    qmk-udev-rules
  ];
  services.udev.packages = with pkgs-stable; [
    via
    vial
  ];

  hardware.keyboard.qmk.enable = true;

  services.hardware.openrgb = {
    enable = true;
    package = pkgs-stable.openrgb;
  };
}
