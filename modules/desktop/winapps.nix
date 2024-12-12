{winapps, ...}: let
  system = "x86_64-linux";
in {
  environment.systemPackages = [
    winapps.packages.${system}.winapps
    winapps.packages.${system}.winapps-launcher
  ];
}
