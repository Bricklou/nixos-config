{pkgs-stable, ...}: {
  programs = {
    # live streaming
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
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
