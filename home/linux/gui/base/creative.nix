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
