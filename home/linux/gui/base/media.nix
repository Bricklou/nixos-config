{pkgs, ...}: {
  # media - control and enjoy audio/video
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer

    # video/audio tools
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
  ];
}