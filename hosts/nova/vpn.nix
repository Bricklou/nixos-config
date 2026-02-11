{...}: {
  networking.firewall.checkReversePath = "loose";

  networking.firewall = {
    # if packets are still dropped, they will show up in dmesg
    logReversePathDrops = true;

    extraInputRules = ''
      udp dport 51820 counter accept comment "Allow WireGuard incoming"
      udp sport 51820 counter accept comment "Allow WireGuard return traffic"
    '';
  };
}
