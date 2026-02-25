self: (_: super: {
  python313Packages =
    super.python313Packages
    // {
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/python-modules/kde-material-you-colors/default.nix
      kde-material-you-colors = super.python313Packages.kde-material-you-colors.overridePythonAttrs (oldAttrs: {
        version = "2.0.2";

        src = super.fetchFromGitHub {
          owner = "luisbocanegra";
          repo = "kde-material-you-colors";
          tag = "v2.0.2";
          hash = "sha256-fvDWBcXCIviCXMlLFPowJttNmpX1JO1OZsnSPyNhLv8=";
        };

        dependencies =
          (oldAttrs.dependencies or [])
          ++ [
            super.pywal16
            super.python313Packages.magic
          ];
      });
    };
})
