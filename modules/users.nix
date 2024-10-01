{
  username,
  pkgs,
  ...
}: {
  # Don't allow mutation of users outside the config.
  #users.mutableUsers = false;

  users.groups = {
    users = {};
    docker = {};
  };

  # Define a user account. Don't forgot to set a password with `passwd`.
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "users"
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
  };
}
