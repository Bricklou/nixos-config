{pkgs, ...}: {
  programs.starship = {
    enable = true;

    enableFishIntegration = true;

    # TODO: add starship theme
  };
}
