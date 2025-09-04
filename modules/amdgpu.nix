{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    # General graphics packages
    libva-utils
    libva
    libvdpau
    vaapiVdpau
    libvdpau-va-gl

    # AMD Vulkan driver (RADV is part of mesa)
    amdvlk
    vulkan-tools

    egl-wayland
  ];

  boot.kernelModules = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
}
