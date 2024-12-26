{pkgs, ...}: let
  microsoftEdge = pkgs.microsoft-edge.override {
    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--ozone-platform=wayland"
      "--gtk-version=4"
      "--enable-wayland-ime"
      "--enable-features=Vulkan"
      "--enable-features=VaapiVideoDecodeLinuxGL"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
    ];
  };
in {
  home.packages = [microsoftEdge pkgs.chromium];

  programs = {
    vscode = {
      enable = true;
      # let vscode sycnc and update its configurations & extensions across devices, using github account
      userSettings = {};
    };
  };
}
