{
  pkgs,
  config,
  ...
}: {
  sops.secrets = {
    wireguard_server_privateKey = {};
  };

  networking = {
    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "enp0s1";
      internalInterfaces = ["wg0"];
    };
    firewall = {
      allowedTCPPorts = [53];
      allowedUDPPorts = [53 51820];
    };

    wireguard = {
      enable = true;
      interfaces = {
        wg0 = {
          privateKeyFile = config.sops.secrets.wireguard_server_privateKey.path;

          # Determines the IP address and subnet of the server's end of the tunnel interface.
          ips = ["10.100.0.1/24"];

          # The port that WireGuard listens to. Must be accessible by the client.
          listenPort = 51820;

          # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
          # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
          postSetup = ''
            ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
          '';

          # This undoes the above command
          postShutdown = ''
            ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
          '';

          #inherit (config.sops.secrets.wireguard) peers;
        };
      };
    };
  };
}
