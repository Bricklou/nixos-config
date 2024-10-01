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
    neovim
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
    tmux
  ];

  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };

  # replace default editor with neovim
  environment.variables.EDITOR = "nvim";
}
