# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" "sdhci_pci"];
      kernelModules = ["dm-snapshot"];
    };
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/01f13a9d-0456-45cf-b69e-6929233849cc";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7BC6-FEFD";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };
  fileSystems."/mnt/shared_data" = {
    device = "/dev/disk/by-uuid/cbfd063e-8d76-4249-80a8-791066eec0ed";
    fsType = "ext4";
    options = ["defaults" "user_xattr"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/6ec0a3a1-62cc-4c83-84ad-01c713d5542b";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.udev.packages = [
    (pkgs.writeTextFile
      {
        name = "amdgpu_udev";
        text = ''
          KERNEL=="card1", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
        '';
        destination = "/etc/udev/rules.d/30-amdgpu-pm.rules";
      })
  ];
}
