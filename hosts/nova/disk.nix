{...}: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/664254ac-f7d4-49e4-a367-9b3498682562";
      fsType = "btrfs";
      options = ["subvol=root" "compress=zstd" "noatime" "ssd"];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/664254ac-f7d4-49e4-a367-9b3498682562";
      fsType = "btrfs";
      options = ["subvol=nix" "compress=zstd" "noatime" "ssd"];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/664254ac-f7d4-49e4-a367-9b3498682562";
      fsType = "btrfs";
      options = ["subvol=home" "compress=zstd" "noatime" "ssd"];
    };
    "/mnt/shared" = {
      device = "/dev/disk/by-uuid/664254ac-f7d4-49e4-a367-9b3498682562";
      fsType = "btrfs";
      options = ["subvol=shared" "compress=zstd" "noatime" "ssd"];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/E953-7440";
      fsType = "vfat";
      options = ["umask=0077" "dmask=0077"];
      neededForBoot = true;
    };
  };

  boot.resumeDevice = "/dev/disk/by-uuid/99dc9094-d9b5-4c72-81b3-5614b2a16b06";

  swapDevices = [
    {device = "/dev/disk/by-uuid/99dc9094-d9b5-4c72-81b3-5614b2a16b06";}
  ];

  # disko.devices = {
  #   disk.main = {
  #     device = "/dev/nvme0n1";
  #     content = {
  #       type = "gpt";
  #       partitions = {
  #         # EFI System Partition
  #         ESP = {
  #           type = "EF00";
  #           size = "512M";
  #           content = {
  #             type = "filesystem";
  #             format = "vfat";
  #             mountpoint = "/boot";
  #             mountOptions = ["umask=0077"];
  #           };
  #         };
  #
  #         # Swap partition
  #         swap = {
  #           name = "swap";
  #           size = "32G";
  #           content = {
  #             type = "swap";
  #           };
  #         };
  #
  #         # BTRFS partition
  #         root = {
  #           name = "root";
  #           size = "-300G";
  #           content = {
  #             type = "btrfs";
  #             extraArgs = ["-f"]; # Override existing partition
  #             # Subvolumes must set a mountpoint in order to be mounted,
  #             # unless their parent is mounted
  #
  #             subvolumes = {
  #               # Subvolume name is different from mountpoint
  #               # Root volume containing system files
  #               "/root" = {
  #                 mountpoint = "/";
  #                 mountOptions = ["subvol=root" "compress=zstd" "noatime" "ssd"];
  #               };
  #               # Subvolume name is the same as mountpoint
  #               # Nix volume containing Nix store
  #               # Parent is not mounted so the mountpoint must be set
  #               "/nix" = {
  #                 mountOptions = ["subvol=nix" "compress=zstd" "noatime" "ssd"];
  #                 mountpoint = "/nix";
  #               };
  #               # Subvolume name is the same as the mountpoint
  #               # Home volume containing user files
  #               "/home" = {
  #                 mountOptions = ["subvol=home" "compress=zstd" "noatime" "ssd"];
  #                 mountpoint = "/home";
  #               };
  #
  #               # Subvolume name is different from mountpoint
  #               # Shared volume containing project files and other large data
  #               "/shared" = {
  #                 mountpoint = "/mnt/shared";
  #               };
  #             };
  #           };
  #         };
  #       };
  #     };
  #   };
  # };
}
