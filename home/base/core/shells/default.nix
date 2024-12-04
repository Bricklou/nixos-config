{
  config,
  pkgs,
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
    inherit shellAliases;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
           if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
           then
             shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs-unstable.fish}/bin/fish $LOGIN_OPTION
           fi
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
