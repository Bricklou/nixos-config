{
  config,
  lib,
  ...
}: let
  grub = config.boot.loader.grub;
in {
  # Use grub as bootloader for the system
  boot.loader = lib.mkIf grub.enable {
    grub = {
      fontSize = lib.mkDefault 20;
    };
  };
}
