{pkgs, ...}: {
  # Network discovery, mDNS
  # With this enabled, you can access your machine at <hostname>.local
  # it's more convenient than using the IP address
  # https://avahi.org/
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      domain = true;
      userServices = true;
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

  networking.networkmanager = {
    dns = "systemd-resolved";
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  services.resolved = {
    enable = true;
    dnssec = "false";
    domains = ["~."];
    fallbackDns = [
      # cloudflare
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"

      # dns4eu
      "2a13:1001::86:54:11:100"
      "2a13:1001::86:54:11:200"
      "84.54.11.100"
      "84.54.11.200"
    ];
    dnsovertls = "true";
  };
}
