{
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
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
    "1.1.1.1"
    "1.0.0.1"
  ];

  services.resolved = {
    enable = true;
    dnssec = "false";
    domains = ["~."];
    fallbackDns = [
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
    dnsovertls = "true";
  };
}
