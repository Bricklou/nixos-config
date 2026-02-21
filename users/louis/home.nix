{myvars, ...}: {
  ##################################################
  #
  # All Louis's Home Manager Configuration
  #
  ##################################################

  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/shell
  ];

  programs.git = {
    inherit (myvars) userEmail;
    userName = myvars.userFullname;
    signing.key = "354CB739A8F0FAB1";
  };
}
