{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.clamav
    pkgs.clamtk
  ];
  services.clamav.daemon.enable = true;

  services.clamav.updater.enable = true;
}
