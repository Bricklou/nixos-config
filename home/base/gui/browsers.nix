{pkgs, ...}: {
  home.packages = with pkgs; [
    # web browsers
    firefox
    chromium
    epiphany
    microsoft-edge

    # Mail clients
    thunderbird
  ];
}
