{lib, ...}: {
  # Bootloader
  boot.kernelParams = [
    "video=2800x1800@60"
    "amdgpu.sg_display=0"
  ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
    };
    grub = {
      device = "nodev";
      efiSupport = true;
      efiInstallAsRemovable = true;
      gfxpayloadEfi = "1920x1200x32";
      gfxmodeEfi = "1920x1200x32";
      fontSize = lib.mkForce 34;
      extraEntries = ''
        menuentry "Reboot" {
        	reboot
        }
        menuentry "Poweroff" {
        	halt
        }
      '';
    };
  };
}
