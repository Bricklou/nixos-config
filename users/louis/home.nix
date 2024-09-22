{ pkgs, ... }: {
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
    userName = "Louis Bailleau";
    userEmail = "louis13.bailleau@gmail.com";
    signing.key = "C32401C3BF521179";
  };
}
