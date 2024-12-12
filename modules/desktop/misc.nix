{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  # add user's shel into /etc/shells
  environment.shells = with pkgs; [
    bashInteractive
    pkgs-unstable.fish
  ];

  # set user's default shell system-wide
  users.defaultUserShell = pkgs.bashInteractive;

  environment.variables = {
    # fix https://github.com/NixOS/nixpkgs/issues/238025
    TZ = "${config.time.timeZone}";
  };

  # fix for `sudo xxx` in kitty/wezterm/foot and other modern terminal emulators
  security.sudo.keepTerminfo = true;

  # list packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnumake
  ];

  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
  };

  programs = {
    # The OpenSSH agent remembers private keys for you
    # so that you don't have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent
    ssh.startAgent = true;
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };
}
