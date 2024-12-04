{
  pkgs,
  myvars,
  ...
}: {
  # auto upgrade nix to the unstable version
  # https://github.com/NixOS/nixpkgs/blobl/nixos-unstable/pkgs/tools/package-management/nix/default.nix#L24
  nix.package = pkgs.nixVersions.latest;

  # for security reasons, do not load neovim's user config
  # since EDITOR may be used to edit some critical files
  environment.variables.EDITOR = "nvim --clean";

  environment.systemPackages = with pkgs; [
    # core tools
    fastfetch
    neovim #Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    go-task
    direnv
    fish # fish shell
    git # used by nix flakes
    git-lfs
    tmux

    # archives
    zip
    xz
    zstd
    p7zip
    unrar

    # Text processing
    # Docs: https://github.com/learnbyexample/Command-line-text-processing
    gnugrep # GNU grep, provides `grep`/`egrep`/`fgrep`
    gnused # GNU sed, very powerful (mainly for replacing text in files)
    gawk # GNU awk, a pattern scanning and processing language
    jq # A lightweght and flexible command-line JSON processor

    #networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    wget
    curl
    nmap # An utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    file
    findutils
    which
    tree
    gnutar
    rsync
  ];

  users.users."${myvars.username}" = {
    description = myvars.userFullname;
  };

  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };
}
