{...}: {
  boot = {
    # Bootloader
    kernelParams = [
      "video=2800x1800@60"
      "amdgpu.sg_display=0"
    ];

    resumeDevice = "/dev/mapper/vg-swap";

    loader = {
      efi = {
        canTouchEfiVariables = false;
      };
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
    };

    initrd = {
      systemd.enable = true;

      luks.devices = {
        luksroot = {
          device = "/dev/disk/by-uuid/8e2bacd5-757f-4cd4-bd30-b64fc4f3cdd0";
          preLVM = true;
          allowDiscards = true;
        };
      };
    };
  };
}
