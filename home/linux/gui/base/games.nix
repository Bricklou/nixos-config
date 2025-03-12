{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.desktop.gaming {
    home.packages = with pkgs; [
      mangohud # A modification of the Mesa Vulkan overlay that includes GUI improvements, temperature (GPU, CPU), VRAM usage, frame timing, frametime graph, CPU/GPU load, and more
      gamescope # SteamOs session compositing window manager
      prismlauncher # A free, open source launcher for Minecraft
      protontricks # A script to install DLLs needed to work around problems in Proton
    ];
  };
}
