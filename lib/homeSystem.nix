{
  inputs,
  lib,
  system,
  genSpecialArgs,
  home-modules,
  specialArgs ? (genSpecialArgs system),
  myvars,
  ...
}: let
  inherit (inputs) nixpkgs home-manager;
in
  home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {system = "x86_64-linux";};
    modules = home-modules;
    extraSpecialArgs = {inherit inputs system specialArgs;};
  }
