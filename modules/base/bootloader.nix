{ lib, ...}: {
  boot.loader = {
    grub = {
      enable = true;
      configurationLimit = lib.mkDefault 10;
      useOSProber = false;
    };
  };
}
