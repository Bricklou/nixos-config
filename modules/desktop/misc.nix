{
  config,
  lib,
  pkgs,
  ...
}: {
  #add user's shell into /etc/shells
  environment.shells = with pkgs; [
    bashInteractive
    pkgs.fish
  ];

  # set user's default shell system-wide
  users.defaultUserShell = pkgs.bashInteractive;

  #List packages installed in system profile. To search, run
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnumake
  ];

  services = {
    gvfs.enable = true; # Mount, trash, and other functionnalities
  };

  programs = {
    # The OpenSSH agent remembers private keys for you
    # so that you don't have to type in passphrase every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent
    ssh.startAgent = true;
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };
}
