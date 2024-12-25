{lib, ...}: {
  # Bootloader
  boot.kernelParams = [
    "resume=/dev/mapper/vgpool-swap"
    "video=2800x1800@60"
    "amdgpu.sg_display=0"
  ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      device = "nodev";
      efiSupport = true;
      gfxpayloadEfi = "1920x1200x32";
      gfxmodeEfi = "1920x1200x32";
      fontSize = lib.mkForce 34;
      extraEntries = ''
        menuentry 'Arch Linux' --class arch --class gnu-linux --class os $menuentry_id_option 'gnulinux-simple-522d414c-a3eb-4746-8682-8a851c57eb07' {
        	insmod part_gpt
        	insmod fat
        	search --no-floppy --fs-uuid --set=root 7BC6-FEFD
        	linux /vmlinuz-linux root=/dev/dm-0
        	initrd /initramfs-linux.img
        }
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
