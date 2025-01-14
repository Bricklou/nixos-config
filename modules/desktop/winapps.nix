{winapps, ...}: let
  system = "x86_64-linux";
in {
  # set up binary caches
  nix.settings = {
    substituters = ["https://winapps.cachix.org"];
    trusted-public-keys = ["winapps.cachix.org-1:HI82jWrXZsQRar/PChgIx1unmuEsiQMQq+zt05CD36g="];
  };

  environment.systemPackages = [
    winapps.packages.${system}.winapps
    winapps.packages.${system}.winapps-launcher
  ];
}
