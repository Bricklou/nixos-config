{pkgs-stable, ...}: {
  # media - control and enjoy audio/video
  home.packages = with pkgs-stable; [
    # audio control
    pavucontrol
    paprefs
    playerctl
    kdePackages.phonon
    rnnoise-plugin

    # video/audio tools
    libva-utils
    vdpauinfo
    vulkan-tools
    mesa-demos

    # media players
    vlc
  ];
}
