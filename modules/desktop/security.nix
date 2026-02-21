{pkgs, ...}: {
  # security with polkit
  security.polkit.enable = true;

  # Enable YubiKey packages
  services.udev.packages = [pkgs.yubikey-personalization];

  security.pam.yubico = {
    enable = true;
    debug = true;
    mode = "challenge-response";
    id = ["32855598"];
  };

  # gpg agent with pinentry
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
    enableSSHSupport = false;
    settings.default-cache-ttl = 4 * 60 * 60; # 4 hours
    enableExtraSocket = true;
  };

  # Locking the screen when a Yubikey is unplugged
  services.udev.extraRules = ''
    ACTION=="remove",\
     ENV{ID_BUS}=="usb",\
     ENV{ID_MODEL_ID}=="0407",\
     ENV{ID_VENDOR_ID}=="1050",\
     ENV{ID_VENDOR}=="Yubico",\
     RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';
}
