self: (_: super: {
  python313Packages =
    super.python313Packages
    // {
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/python-modules/kde-material-you-colors/default.nix
      kde-material-you-colors = super.python313Packages.kde-material-you-colors.overridePythonAttrs (oldAttrs: {
        dependencies =
          (oldAttrs.dependencies or [])
          ++ [
            super.python313Packages.pywal
          ];
      });
    };
})
