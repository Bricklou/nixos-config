{pkgs-stable, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs-stable; [
    # General graphics packages
    libva
    libva-utils
    libvdpau
    mesa
    vaapiVdpau
    libvdpau-va-gl

    # AMD Vulkan driver (RADV is part of mesa)
    vulkan-tools

    egl-wayland
    kdePackages.qtwayland
  ];

  boot.kernelModules = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
}
