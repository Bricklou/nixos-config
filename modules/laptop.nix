{...}: {
  # suspend-then-hibernate
  # https://www.man7.org/linux/man-pages/man5/systemd-sleep.conf.5.html
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernate=yes
    HibernateOnACPower=yes
  '';

  services.logind = {
    lidSwitch = "hibernate";
    lidSwitchDocked = "hibernate";
    lidSwitchExternalPower = "hibernate";

    powerKey = "hibernate";
    powerKeyLongPress = "poweroff";
  };

  # Enable hibernate
  systemd.targets = {
    sleep.enable = true;
    suspend.enable = true;
    hibernate.enable = true;
  };
}
