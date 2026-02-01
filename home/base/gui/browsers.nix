{
  pkgs,
  pkgs-stable,
  zen-browser,
  ...
}: {
  imports = [
    zen-browser.homeModules.twilight-official
  ];

  config = {
    home.packages = with pkgs; [
      # web browsers
      firefox
      chromium
      pkgs-stable.epiphany
      microsoft-edge

      # Mail clients
      thunderbird
    ];

    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [pkgs.firefoxpwa pkgs.kdePackages.plasma-browser-integration];
    };
  };
}
