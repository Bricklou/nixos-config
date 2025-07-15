{pkgs-stable, ...}: {
  home.packages = with pkgs-stable; [
    # creative
    gimp # image editing
    inkscape # vector graphics
  ];

  programs = {
    # live streaming
    obs-studio = {
      enable = true;
      plugins = with pkgs-stable.obs-studio-plugins; [
        # screen capture
        obs-vaapi
        obs-vkcapture
        obs-gstreamer
        input-overlay
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
