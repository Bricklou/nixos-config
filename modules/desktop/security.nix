{
  pkgs,
  lib,
  ...
}: {
  # security with polkit
  security.polkit.enable = true;

  # Enable YubiKey packages
  # https://joinemm.dev/blog/yubikey-nixos-guide
  # https://joshbuker.com/blog/how-to-use-a-gpg-smartcard-for-git-and-ssh/

  services = {
    pcscd.enable = true;
    udev.packages = [pkgs.yubikey-personalization];
  };

  systemd.services.pcscd.wantedBy = ["multi-user.target"];

  environment.systemPackages = with pkgs; [
    yubioath-flutter
  ];

  security.pam = {
    u2f = {
      enable = true;

      settings = {
        interactive = true;
        cue = true;

        authfile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
          "louis:A2I9LzECDa+bn4uLiDDHj0vh4en6TlWEix3cJAIbzwwOjsvsfWmj0j9ho3J30zBJOuF8vPfA1KBgN4cLORMnoA==,YL3zDz+EQ3Qky6irNgxRrrTYNb6qi5s0FBbPPtSKcPezlT9z0E/SG0gkg8U+QPVXrbbSZZFHtBkevpUIPv8hjw==,es256,+presence"
        ]);
      };
    };

    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      kde.u2fAuth = true;
    };
  };

  # gpg agent with pinentry
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
    enableSSHSupport = true;
    settings.default-cache-ttl = 4 * 60 * 60; # 4 hours
    enableExtraSocket = true;
  };
  programs.ssh.startAgent = false;

  # Enable SmartCard udev rules
  hardware.gpgSmartcards.enable = true;

  # Configuration spécifique pour scdaemon
  environment.etc."gnupg/scdaemon.conf".text = ''
    disable-ccid
    pcsc-shared
  '';

  services.udev.extraRules = ''
    ACTION=="remove",\
     ENV{ID_BUS}=="usb",\
     ENV{ID_MODEL_ID}=="0406",\
     ENV{ID_VENDOR_ID}=="1050",\
     ENV{ID_VENDOR}=="Yubico",\
     RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';
}
