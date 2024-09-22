{
  pkgs,
  config,
  ...
}:
#media - control and enjoy audio/video
{
  programs = {
    obs-studio.enable = true;
  };
}
