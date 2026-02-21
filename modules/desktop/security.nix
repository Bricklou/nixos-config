{
  pkgs,
  lib,
  ...
}: {
  # security with polkit
  security.polkit.enable = true;

  # Enable YubiKey packages
  # https://joinemm.dev/blog/yubikey-nixos-guide
  services = {
    pcscd.enable = true;
    udev.packages = [pkgs.yubikey-personalization];
  };

  security.pam = {
    u2f = {
      enable = true;
      settings = {
        interactive = true;
        cue = true;

        origin = "pam://yubi";
        authfile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
          ":javYbqsH1wawZ1GanIcC7lr5zPeFXYaCXUfz9VRqoCI7X47KqNrQmjW5/46TqiQxCwcXhjPBKISqGx7FWSU/0w==,sSAbdgq04dFW2oBBDPijOiK2fTVztzLw+geywVfp6JxGwt/syKlNJspF7chgF0sN9gzKkt7Rm6ozuKNUEItn6w==,es256,+p"
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
