{
  config,
  lib,
  pkgs,
  myvars,
  ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exists!
  #
  #	https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ${config.home.homeDirectory}/.gitconfig
  '';

  home.packages = with pkgs; [
    github-cli
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = myvars.userFullname;
    inherit (myvars) userEmail;

    extraConfig = {
      init.defaultBranch = "main";
      trim.bases = "develop,master,main"; # for git-trim
      push.autoSetupRemote = true;
      pull.rebase = true;

      # replace https with ssh
      url = {
        "ssh://git@github.com/bricklou" = {
          insteadOf = "https://github.com/bricklou";
        };
      };

      aliases = {
        # git commit
        cm = "commit --message";
        cam = "commit --amend --message";
        cane = "commit --amend --no-edit";
      };

      diff.sopsdiffer.textconv = "sops decrypt";
    };

    includes = [
      {
        path = "~/Documents/rainbow/.gitconfig";
        condition = "gitdir:~/Documents/rainbow/";
      }
    ];

    # A syntax-highlitghing pager in Rust (2019 ~ Now)
    delta = {
      enable = true;
      options = {
        diff-so-fancy = true;
        line-numbers = true;
        true-color = "always";
        # features => named groups of settings, used to keep related settings organized
        # features = "";
      };
    };
  };
}
