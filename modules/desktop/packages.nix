{
  pkgs,
  pkgs-stable,
  lib,
  ...
}: {
  boot.loader.timeout = lib.mkForce 10; # wait for x seconds to select the boot entry.

  environment.systemPackages =
    (with pkgs; [
      wl-clipboard

      (chromium.override {
        commandLineArgs = [
          "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
          "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
          "--enable-features=UseMultiPlaneFormatForHardwareVideo"
          "--ignore-gpu-blocklist"
          "--enable-zero-copy"

          "--ozone-platform-hint=auto"
          "--ozone-platform=wayland"
          "--gtk-version=4"
          "--enable-wayland-ime"
        ];
        enableWideVine = true;
      })

      firefox
      epiphany
    ])
    ++ (with pkgs-stable; [
      (microsoft-edge.override {
        # convert array into string for command lines
        commandLineArgs = lib.concatStringsSep " " [
          "--ignore-gpu-blocklist"
          "--enable-zero-copy"
          "--gtk-version=3"
          "--use-gl=angle"
          "--use-angle=gl"
          "--enable-features=UseMultiPlaneFormatForHardwareVideo,VaapiVideoDecodeLinuxGL,VaapiVideoEncodeLinuxGL"
          "--enable-features=AcceleratedVideoDecoder,AcceleratedVideoEncoder"
          "--ozone-platform=wayland"
        ];
      })
    ]);
}
