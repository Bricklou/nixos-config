{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    config = {
      common = {
        # use xdg-desktop-portal-kde for every portal interface...
        default = ["kde"];
      };
    };

    # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1
    # This will make xdg-open use the portal to open programs,
    # which resolves bugs involving programs opening inside FHS envs of with unexpected env vars from wrappers.
    # xdg-open is used by almost all programs to open an unknown file/uri
    # alacritty as an example, it use xdg-open as default, but you can also customize this behaviour
    # and vscode has open like `External Uri Openers`
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
    ];
  };
}
