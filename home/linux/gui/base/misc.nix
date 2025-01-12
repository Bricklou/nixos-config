{pkgs, ...}: {
  home.packages = with pkgs; [
    # GUI apps

    # instant messages
    vesktop

    # remote desktop (rdp connect)
    remmina
    freerdp # required by remmina

    # misc
    spectacle
    kcalc
    filelight
    kdePackages.kdeconnect-kde

    obsidian

    # some app require a key store
    libsecret
  ];

  # allow fontconfig to discover fonts and configurations installed through home.packages
  # Install fonts at system-level, not user-level
  fonts.fontconfig.enable = true;
}
