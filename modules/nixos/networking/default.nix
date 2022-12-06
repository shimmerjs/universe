{
  networking.useDHCP = false;

  # https://tailscale.com/kb/1063/install-nixos/
  services.tailscale.enable = true;
  networking.nameservers = [ "100.100.100.100" "8.8.8.8" "1.1.1.1" ];
  networking.search = [ "dpu.sh.beta.tailscale.net" ];
  networking.firewall.checkReversePath = "loose";
}
