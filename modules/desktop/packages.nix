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

      # https://github.com/NixOS/nixpkgs/issues/435671
      # widevine-cdm = pkgs.widevine-cdm.overrideAttrs (oldAttrs: {
      #   src = pkgs.fetchzip {
      #     url = "https://alien.slackbook.org/slackbuilds/chromium-widevine-plugin/build/4.10.2891.0-linux-x64.zip";
      #     hash = "sha256-ZO6FmqJUnB9VEJ7caJt58ym8eB3/fDATri3iOWCULRI";
      #
      #     ## builds just fine, but fails to play DRM content - PEBCAK?
      #     #url = "https://dl.google.com/widevine-cdm/1.4.9.1088-linux-x64.zip";
      #     #hash = "sha256-AT/LlX1q5LuoB+xxgYRQlEKhhCmw37q7FET3IavSzJo";
      #
      #     stripRoot = false;
      #   };
      # });
    })

    firefox
    epiphany

    (microsoft-edge.override {
      # convert array into string for command lines
      commandLineArgs = lib.concatStringsSep " " [
        # "--use-gl=angle --use-angle=vulkan --enable-features=UseMultiPlaneFormatForHardwareVideo,VaapiVideoDecodeLinuxGL,VaapiVideoEncodeLinuxGL --enable-features=AcceleratedVideoDecoder,AcceleratedVideoEncoder --enable-features=VaapiVideoDecoder,VaapiVideoEncoder --ozone-platform=wayland"

        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
        "--gtk-version=3"
        "--use-gl=angle"
        "--use-angle=vulkan"
        "--enable-features=UseMultiPlaneFormatForHardwareVideo,VaapiVideoDecodeLinuxGL,VaapiVideoEncodeLinuxGL"
        "--enable-features=AcceleratedVideoDecoder,AcceleratedVideoEncoder"
        "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder"
        "--ozone-platform=wayland"
      ];
    })
  ];
}
