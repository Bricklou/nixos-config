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

  environment.systemPackages = with pkgs; [
    yubioath-flutter
  ];

  security.pam = {
    u2f = {
      enable = true;
      settings = {
        interactive = true;
        cue = true;

        origin = "pam://yubi";
        authfile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
          "louis:k1+mryOTWetSRo7erV4N3YUKAuqXEjHjatjcaDsmkChJbH+SQ+zmeb12VFfgJQRFwZQa9EsUdz/SqJsiE73xOA==,SCB/64X8rpBvfnliLWK7dRGFVYigNvJODrdx0Drg/LO4dyQsXBG6ThEI30haTs4QqGFlWrivMEETXNjhDjbAKg==,es256,+presence"
        ]);
      };
    };

    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
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
  '';
}
