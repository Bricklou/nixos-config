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

  direnvrcConfig = ''
    realpath() {
      [[ $1 = /* ]] && echo "$1" || echo "$PWD/''${1#./}"
    }
    layout_python-venv() {
      local python=''${1:-python3}
      [[ $# -gt 0 ]] && shift
      unset PYTHONHOME
      if [[ -n $VIRTUAL_ENV ]]; then
        VIRTUAL_ENV=$(realpath "''${VIRTUAL_ENV}")
      else
        local python_version
        python_version=$("$python" -c "import platform; print(platform.python_version())")
        if [[ -z $python_version ]]; then
            log_error "Could not detect Python version"
            return 1
        fi
        VIRTUAL_ENV=$PWD/.direnv/python-venv-$python_version
      fi
      export VIRTUAL_ENV
      if [[ ! -d $VIRTUAL_ENV ]]; then
        log_status "no venv found; creating $VIRTUAL_ENV"
        "$python" -m venv "$VIRTUAL_ENV"
      fi

      PATH="''${VIRTUAL_ENV}/bin:''${PATH}"
      export PATH
    }
  '';
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

  # Copy the direnvPythonVenvConfig to ~/.config/direnv/direnvrc
  home.file.".config/direnv/direnvrc".text = direnvrcConfig;

  # Add support for nix-shell for fish
  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };
}
