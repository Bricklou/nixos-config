{...}: {
  # suspend-then-hibernate
  # https://www.man7.org/linux/man-pages/man5/systemd-sleep.conf.5.html
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernate=yes
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
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

  boot.kernelParams = [
    # Currently needs amdgpu.dcdebugmask=0x10 as a Kernel parameters to avoid display glitches as shown in this issue.
    # https://gitlab.freedesktop.org/drm/amd/-/issues/3388
    "amdgpu.dcdebugmask=0x10"
  ];
}
