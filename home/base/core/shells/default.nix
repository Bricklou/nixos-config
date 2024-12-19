{
  config,
  pkgs,
  ...
}: let
  shellAliases = {
    "rmr" = "rm -r";
  };

  localBin = "${config.home.homeDirectory}/.local/bin";
  goBin = "${config.home.homeDirectory}/go/bin";
  rustBin = "${config.home.homeDirectory}/.cargo/bin";
in {
  home.shellAliases = shellAliases;

  programs.fish = {
    enable = true;
    package = pkgs.fish;
    inherit shellAliases;
    shellInit = ''
      fish_add_path ${localBin} ${goBin} ${rustBin}
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
           if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
           then
             shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
           fi
    '';
  };
}
