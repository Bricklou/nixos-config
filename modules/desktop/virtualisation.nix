{
  pkgs,
  pkgs-stable,
  ...
}: {
  ##################################################
  #
  #	Virtualisation - Libvirt (QEMU/KVM) / Docker
  ##################################################

  # Enable nested virtualization, required by security containers and nested vm.
  # This should be set per host in /hosts, not here
  #
  ## For AMD CPU, add "kvm-amd" to kernelModules
  # boot.kernelModules = ["kvm-amd"];
  # boot.extraModprobeConfig = "options kvm_amd nested=1"; # for amd cpu
  #
  ## For Intel CPU, add "kvm-intel" to kernelModules
  # boot.kernelModules = ["kvm-amd"];
  # boot.extraModprobeConfig = "options kvm_intel nested=1"; # for amd cpu

  boot.kernelModules = ["vfio-pci"];

  # Enable binfmt emulation for aarch64-linux
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  # Ensure IPv6 forwarding is enabled
  boot.kernel.sysctl = {
    "net.ipv6.conf.all.forwarding" = 1;
    "net.ipv6.conf.default.forwarding" = 1;
  };

  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        # enable pulling using containerd, which supports restarting from a partial pull
        # https://docs.docker.com/storage/containerd/
        "features" = {
          "containerd-snapshotter" = true;
        };
        ipv6 = true;
        fixed-cidr-v6 = "fd00::/64";
        ip6tables = true;
      };

      # start dockerd on boot.
      # This is required for containers which are created with the `--restart=always` flag to work.
      enableOnBoot = true;

      extraOptions = "--iptables=false";
    };

    libvirtd = {
      enable = true;
      # Hanging this option to false may cause file permissions issues for existing guests.
      # To fix these, manually change ownership of affected files in /var/lib/libvirt/qemu to qemu-libvirtd
      qemu.runAsRoot = true;
      qemu.vhostUserPackages = with pkgs; [
        virtiofsd
      ];
      extraConfig = ''
        uri_default = "qemu:///system"
      '';
    };
  };

  # Enable qemu guest agent
  services.qemuGuest.enable = true;

  environment.systemPackages = with pkgs; [
    # Need to add [File (in the menu bar) -> Add connection] when start for the first time
    virt-manager

    # QEMU/KVM (HostCpuOnly), provides:
    # qemu-storage-daemon qemu-edid qemu-ga
    # qemu-pr-helper qemu-nbd elf2dmp qemu-img qemu-io
    # qemu-kvm qemu-system-x86_64 qemu-system-aarch64 qemu-system-i386
    qemu_kvm

    # Install QEMU (other architectures), provides:
    #	.....
    #	qemu-loongarch64 qemu-system-loongarch64
    #	qemu-riscv64 qemu-system-riscv64 qemu-riscv32 qemu-system-rscv32
    #	qemu-system-arm qemu-arm qemu-armeb qemu-system-aarch64 qemu-aarch64 qemu-aarch64_be
    #	qemu-system-xtensa qemu-xtensa qemu-system-xtensaeb qemu-xtensaeb
    #	.....
    qemu

    # WinBoat
    winboat
  ];
}
