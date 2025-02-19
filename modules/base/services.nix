{
  # Enable log rotation
  services.logrotate = {
    enable = true;
    settings = {
      # global options
      header = {
        dateext = true;
      };

      "/var/log/journal/*.log" = {
        frequency = "daily";
        rotate = 3;
      };
    };
  };

  # Disable core dumps
  services.coredump.enable = false;
}
