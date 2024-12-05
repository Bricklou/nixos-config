{pkgs, ...}: {
  home.packages = with pkgs; [
    gamescope # SteamOs session compositing window manager
    prismlauncher # A free, open source launcher for Minecraft
    protontricks # A script to install DLLs needed to work around problems in Proton
  ];
}
