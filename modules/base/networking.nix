{pkgs, ...}: {
  # Network discovery, mDNS
  # With this enabled, you can access your machine at <hostname>.local
  # it's more convenient than using the IP address
  # https://avahi.org/
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    nssmdns6 = true;
    openFirewall = true;
    publish = {
      enable = true;
      domain = true;
      userServices = true;
    };
  };

  networking = {
    # 1. Enable modern nftables instead of legacy iptables
    nftables.enable = true;

    firewall = {
      enable = true;

      # Block all incoming by default (NixOS default is already true)
      # We only open what is strictly necessary.

      # Since it is for a client usage, there is no need to open ports.
      # The firewall automatically allows response traffic for the requests.
      allowedTCPPorts = [];
      allowedUDPPorts = [];

      # Block all incoming traffic, even pings, for maximum "stealth"
      allowPing = false;

      # Still trust your VPN interfaces so local services (like a printer
      # or internal tool) work once the tunnel is encrypted.
      # Also trust VMs and Containers to talk to the Host and route their traffic out to the internet.
      trustedInterfaces = ["wg0" "tun0" "docker0" "virbr0"];

      # Fixes for Guest Connectivity
      # Some enterprise VPNs or strict network routes break if "Reverse Path Filtering"
      # is too aggressive on virtual bridges.
      checkReversePath = "loose";

      # Allow Forwarding (Required for NAT/Internet in VMs)
      # This enables the kernel to pass traffic from virbr0/docker0 to your main NIC.
      extraForwardRules = ''
        iifname "docker0" accept
        iifname "virbr0" accept
      '';
    };
  };

  networking.nameservers = [
    # cloudflare
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
    "1.1.1.1"
    "1.0.0.1"

    # dns4eu
    "2a13:1001::86:54:11:100"
    "2a13:1001::86:54:11:200"
    "84.54.11.100"
    "84.54.11.200"
  ];
}
