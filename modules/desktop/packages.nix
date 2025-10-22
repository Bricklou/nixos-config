{
  pkgs,
  pkgs-stable,
  lib,
  ...
}: {
  boot.loader.timeout = lib.mkForce 10; # wait for x seconds to select the boot entry.

  environment.systemPackages = with pkgs-stable; [
    wl-clipboard
  ];
}
