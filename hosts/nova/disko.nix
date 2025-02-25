{...}: {
  disko.devices = {
    disk.main = {
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          # EFI System Partition
          ESP = {
            type = "EF00";
            size = "512M";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = ["umask=0077"];
            };
          };

          # Swap partition
          swap = {
            name = "swap";
            size = "32G";
            content = {
              type = "swap";
              resumeDevice = true;
            };
          };

          # BTRFS partition
          root = {
            name = "root";
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = ["-f"]; # Override existing partition
              # Subvolumes must set a mountpoint in order to be mounted,
              # unless their parent is mounted

              subvolumes = {
                # Subvolume name is different from mountpoint
                # Root volume containing system files
                "/root" = {
                  mountpoint = "/";
                };
                # Subvolume name is the same as mountpoint
                # Nix volume containing Nix store
                # Parent is not mounted so the mountpoint must be set
                "/nix" = {
                  mountOptions = ["subvol=nix" "compress=zstd" "noatime"];
                  mountpoint = "/nix";
                };
                # Subvolume name is the same as the mountpoint
                # Home volume containing user files
                "/home" = {
                  mountOptions = ["compress=zstd"];
                  mountpoint = "/home";
                };

                # Subvolume name is different from mountpoint
                # Shared volume containing project files and other large data
                "/shared" = {
                  mountpoint = "/mnt/shared";
                  # Configure permissions so that any users from the `shared-data` group can read/write
                };
              };
            };
          };
        };
      };
    };
  };
}
