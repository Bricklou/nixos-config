{pkgs, ...}: {
  # Use grub as bootloader for the system
  boot.loader.grub = {
    enable = true;
    #font = "${pkgs.terminus_font}/share/fonts/terminus/ter_u20n.otn";
  };

  # Install necessary font for grub
  environment.systemPackages = with pkgs; [
    terminus_font
  ];

  # for power management
  services = {
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;
  };
}
