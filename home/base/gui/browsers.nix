{
  pkgs,
  pkgs-stable,
  zen-browser,
  ...
}: let
  # Pin Microsoft Edge to last working build on Linux.
  # @upstream-issue https://github.com/NixOS/nixpkgs/pull/490349
  # @upstream-issue https://github.com/NixOS/nixpkgs/issues/492012
  # Overrides the package to use the previous stable 144.0.3719.115 version.
  microsoft-edge = let
    version = "144.0.3719.115";
  in
    pkgs.microsoft-edge.overrideAttrs (_old: {
      inherit version;
      src = pkgs.fetchurl {
        url = "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${version}-1_amd64.deb";
        hash = "sha256-HoV2D51zxewFwwu92efEDgohu1yJf1UyjekO3YWZqPc=";
      };
    });
in {
  imports = [
    zen-browser.homeModules.default
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
