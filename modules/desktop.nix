{
 pkgs,
 config,
 lib,
 ...
}:
with lib; let
  cfgWayland = config.modules.desktop.wayland;
  cfgXorg = config.modules.desktop.xorg;
in {
  imports = [
    ./base
    ./desktop
  ];

  options.modules.desktop = {
    wayland = {
      enable = mkEnableOption "Wayland Display Server";
    };
    xorg = {
      enable = mkEnableOption "Xorg Display Server";
    };
  };

  config = mkMerge [
    (mkIf cfgWayland.enable {
      ########################################
      # NixOS's Configuration for Wayland based on Window Manager
      ########################################
      xdg.portal = {
        enable = true;
	wlr.enable = true;
	extraPortals = with pkgs; [
	  xdg-desktop-protal-wlr
	];
     };

     services = {
       xserver.enable = false; # disable xorg server

       displayManager = {
         sddm = {
           # Configure sddm as login manager
	   enable = true;

	   # Boot sddm using wayland
	   wayland.enable = true;
	 };

         # use plasma as default session
	 defaultSession = "plasma";
       };
       

       # Use plasma 6 as desktop session
       desktopManager.plasma6.enable = true;
     };

     #Enable wayland for chromium-based apps
     environment.sessionVariables.NIXOS_OZONE_WL = "1";

     # Disable some packages from plasma 6
     environment.plasma6.excludePackages = with pkgs.kdePackages; [
       oxygen
     ];
    })
  ];
}
