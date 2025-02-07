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
  name = "nova-arch";

  base-modules = {
    home-modules =
      (map mylib.relativeToRoot [
        "home/base/tui/editors/packages.nix"
        "home/base/tui/editors/neovim"
        "home/base/tui/zellij"
      ])
      ++ [
        (import (mylib.relativeToRoot "home/base/home.nix") (args // {inherit myvars;}))
        {
          home.homeDirectory = "/home/${myvars.username}";
          home.username = myvars.username;
          home.stateVersion = "24.11";
        }
      ];
  };

  modules = base-modules;
in {
  homeConfigurations = {
    "${name}" = mylib.homeSystem (modules // args);
  };
}
