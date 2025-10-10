{pkgs-stable, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs-stable; [
    # General graphics packages
    libva
    libva-utils
    mesa
    vulkan-loader
    vulkan-tools
    libvdpau
    vaapiVdpau
    libvdpau-va-gl

    # AMD Vulkan driver (RADV is part of mesa)
    vulkan-tools

    egl-wayland
  ];

  boot.kernelModules = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
}
