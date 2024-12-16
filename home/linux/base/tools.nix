{pkgs, ...}: {
  # Linux Only Packages
  home.packages = with pkgs; [
    # misc
    libnotify

    virt-viewer #vnc connect to VM, used by kubevirt

    minicom
  ];
}
