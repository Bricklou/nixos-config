{
  # NOTE: the args not used in this file CAN NO be removed!
  # because haummea pass argument lazily,
  # and these arguments are used in the functions like `mylib.nixosSystem`, etc.
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  config,
  ...
} @ args: let
  name = "vpn-server";

  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
      "modules/server.nix"

      # host specific modules
      "hosts/${name}"
    ];
    home-modules = map mylib.relativeToRoot [
      # common
      "home/linux/tui.nix"
    ];
  };

  modules = base-modules;
in {
  nixosConfigurations.${name} = mylib.nixosSystem (modules // args);
}
