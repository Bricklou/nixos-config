{
  config,
  pkgs-unstable,
  ...
}: let
  shellAliases = {
  };

  localBin = "${config.home.homeDirectory}/.local/bin";
  goBin = "${config.home.homeDirectory}/go/bin";
  rustBin = "${config.home.homeDirectory}/.cargo/bin";
in {
  home.shellAliases = shellAliases;

  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;
  };
}
