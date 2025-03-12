{...}: {
  # suspend-then-hibernate
  # https://www.man7.org/linux/man-pages/man5/systemd-sleep.conf.5.html
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernate=yes
    AllowSuspendThenHibernate=yes

    HibernateDelaySec=1300
    HibernateOnACPower=yes
  '';

  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchDocked = "suspend-then-hibernate";
    lidSwitchExternalPower = "suspend-then-hibernate";

    powerKey = "suspend-then-hibernate";
    powerKeyLongPress = "poweroff";
  };

  systemd.targets = {
    hibernate.enable = true;
    suspend-then-hibernate.enable = true;
  };
}
