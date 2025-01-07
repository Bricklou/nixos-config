{pkgs, ...}: {
  home.packages = with pkgs; [
    # creative
    gimp # image editing
    inkscape # vector graphics
  ];

  programs = {
    # live streaming
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        # screen capture
        wlrobs
        obs-vaapi
        obs-nvfbc
        obs-teleport
        obs-vkcapture
        obs-gstreamer
        input-overlay
        looking-glass-obs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
