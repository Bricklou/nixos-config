{
  pkgs,
  lib,
  nixpkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git

    # archives
    zip
    xz
    p7zip

    # Text processing
    gnugrep # GNU Grep

    # Networking tools
    wget
    curl
    
    # misc
    file
    which
    tree
    gnutar
    rsync
  ];

  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };
}
