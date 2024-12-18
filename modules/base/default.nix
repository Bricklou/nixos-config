{
  mylib,
  sops-nix,
  ...
}: {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      sops-nix.nixosModules.sops
    ];
}
