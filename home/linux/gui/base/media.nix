{pkgs, ...}: {
  # media - control and enjoy audio/video
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl

    # video/audio tools
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo

    # media players
    vlc
  ];
}
