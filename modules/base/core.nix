{
  pkgs,
  lib,
  ...
}: {
  # Use grub as bootloader for the system
  boot.loader.grub = {
    enable = true;
    fontSize = lib.mkDefault 20;
  };

  # for power management
  services = {
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;
  };
}
