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
    signing.key = "C32401C3BF521179";
  };
}
