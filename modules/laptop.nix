{...}: {
  # suspend-then-hibernate
  # https://www.man7.org/linux/man-pages/man5/systemd-sleep.conf.5.html
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernate=yes
    AllowSuspendThenHibernate=yes
    AllowHybridSleep=yes

    HibernateDelaySec=30m
    HibernateOnACPower=yes
  '';

  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchDocked = "suspend-then-hibernate";
    lidSwitchExternalPower = "suspend-then-hibernate";

    powerKey = "suspend-then-hibernate";
    powerKeyLongPress = "poweroff";
  };

  # Enable hibernate, hybrid-sleep and suspend-then-hibernate
  systemd.targets = {
    sleep.enable = true;
    suspend.enable = true;
    hibernate.enable = true;
    suspend-then-hibernate.enable = true;
    hybrid-sleep.enable = true;
  };
}
