{pkgs, ...}: {
  imports = [
    ./base
    ./base.nix

    ./desktop
  ];

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      xkb.layout = "fr";
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager.plasma6.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    oxygen
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
