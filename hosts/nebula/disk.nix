{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/0e0b1ada-b3b7-498e-a55f-7d9eeaca7d70";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd"];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/0e0b1ada-b3b7-498e-a55f-7d9eeaca7d70";
      fsType = "btrfs";
      options = ["subvol=@home" "compress=zstd"];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/0e0b1ada-b3b7-498e-a55f-7d9eeaca7d70";
      fsType = "btrfs";
      options = ["subvol=@nix" "compress=zstd" "noatime"];
    };
    "/persist" = {
      device = "/dev/disk/by-uuid/0e0b1ada-b3b7-498e-a55f-7d9eeaca7d70";
      fsType = "btrfs";
      options = ["subvol=@persist" "compress=zstd"];
    };
    "/var/log" = {
      device = "/dev/disk/by-uuid/0e0b1ada-b3b7-498e-a55f-7d9eeaca7d70";
      fsType = "btrfs";
      options = ["subvol=@log" "compress=zstd" "noatime"];
      neededForBoot = true;
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/E953-7440";
      fsType = "vfat";
      options = ["umask=0077" "dmask=0077"];
      neededForBoot = true;
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/a2314226-cc31-4ecb-bda1-d6af2105b6d9";}
  ];
}
