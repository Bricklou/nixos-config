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
  ...
} @ args: let
  name = "nebula";

  base-modules = {
    nixos-modules =
      map mylib.relativeToRoot [
        # common
        "modules/desktop.nix"
        "modules/laptop.nix"
        "modules/amdgpu.nix"

        # host specific modules
        "hosts/${name}"
      ]
      ++ [
        {catppuccin.accent = "blue";}
      ];
    home-modules =
      map mylib.relativeToRoot [
        # common
        "home/linux/gui.nix"

        # host specific module
        "hosts/${name}/home.nix"
      ]
      ++ [
        {catppuccin.accent = "blue";}
      ];
  };

  modules = base-modules;
in {
  nixosConfigurations.${name} = mylib.nixosSystem (modules // args);
}
