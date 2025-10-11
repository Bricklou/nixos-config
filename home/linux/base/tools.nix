{pkgs, ...}: {
  # Linux Only Packages
  home.packages = with pkgs; [
    # misc
    libnotify
  ];
}
