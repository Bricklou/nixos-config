{
  description = "Bricklou's nix configuration";

  outputs = inputs: import ./outputs inputs;

  # Inputs
  inputs = {
    #NixOS official package source, using the nixos' unstable branch by default
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # add git hooks to format nix code before commit
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #generate iso/qcow2/docker/... image from nixos configuration
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  #  outputs = inputs @ {
  #    self,
  #    nixpkgs,
  #    home-manager,
  #    ...
  #  }: {
  #    nixosConfigurations = {
  #      nova = let
  #        username = "louis";
  #        specialArgs = {inherit username;};
  #      in
  #        nixpkgs.lib.nixosSystem {
  #          inherit specialArgs;
  #          system = "x86_64-linux";
  #
  #          modules = [
  #            ./hosts/nova
  #
  #            home-manager.nixosModules.home-manager
  #            {
  #              home-manager.useGlobalPkgs = true;
  #              home-manager.useUserPackages = true;
  #
  #              home-manager.extraSpecialArgs = inputs // specialArgs;
  #              home-manager.users.${username} = import ./users/${username}/home.nix;
  #            }
  #          ];
  #        };
  #    };
  #  };
}
