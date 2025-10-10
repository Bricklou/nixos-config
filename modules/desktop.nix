{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./base
    ./base.nix

    ./desktop
  ];

  config = {
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

    security.pam.services = {
      kde.kwallet.enable = true;
      sddm.kwallet.enable = true;
    };
  };

  # Desktop options
  options.modules.desktop = {
    gaming = lib.mkEnableOption "enable gaming related programs";
  };
}
