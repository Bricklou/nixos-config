{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = with pkgs; [
    # web browsers
    firefox
    chromium
    pkgs-stable.epiphany
    microsoft-edge

    # Mail clients
    thunderbird
  ];
}
