{pkgs, ...}: {
  # Bootloader
  boot.kernelParams = [
    "resume=/dev/mapper/vgpool-swap"
  ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      device = "nodev";
      efiSupport = true;
      gfxmodeEfi = "2880x1880";
      fontSize = 20;
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
