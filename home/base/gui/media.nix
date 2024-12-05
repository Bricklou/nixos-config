{pkgs, ...}: {
  # processing audio/video
  home.packages = with pkgs; [
    # video
    ffmpeg-full

    # images
    imagemagick
    graphviz
  ];
}
