{
  pkgs,
  pkgs-stable,
  lib,
  ...
}: {
  boot.loader.timeout = lib.mkForce 10; # wait for x seconds to select the boot entry.

  environment.systemPackages = with pkgs-stable; [
    wl-clipboard
    rustdesk

    (pkgs.chromium.override {
      commandLineArgs = [
        # Force ANGLE with OpenGL backend
        "--use-gl=angle"
        "--use-angle=gl"

        # VA-API flags (combined into single --enable-features)
        "--enable-features=AcceleratedVideoDecoder,AcceleratedVideoEncoder,VaapiVideoDecoder,VaapiVideoEncoder,VaapiIgnoreDriverChecks,VaapiVideoDecodeLinuxGL,VaapiVideoDecodeLinuxGL"

        # GPU acceleration
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"

        # Wayland
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
      ];
      enableWideVine = true;
    })

    firefox
    epiphany

    (microsoft-edge.override {
      # convert array into string for command lines
      commandLineArgs = lib.concatStringsSep " " [
        # Force ANGLE with OpenGL backend
        "--use-gl=angle"
        "--use-angle=vulkan"

        # VA-API flags (combined into single --enable-features)
        "--enable-features=AcceleratedVideoDecoder,AcceleratedVideoEncoder,VaapiVideoDecoder,VaapiVideoEncoder,VaapiIgnoreDriverChecks,VaapiVideoDecodeLinuxGL,VaapiVideoDecodeLinuxGL,Vulkan"

        # GPU acceleration
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"

        # Wayland
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
      ];
    })
  ];
}
