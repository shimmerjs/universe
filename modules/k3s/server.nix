{ config, lib, pkgs, ... }:
let
  cfg = config.services.k3s-server;
in
with lib;
{
  options = {
    services.k3s-server = {
      ip = mkOption {
        default = "";
        type = with types; uniq string;
        description = ''
          The advertised K8s node IP
        '';
      };
    };
  };

  config = {
    # So Pods can access the API server
    networking.firewall.allowedTCPPorts = [ 6443 ];

    services.k3s = {
      enable = true;
      role = "server";
      disableAgent = true;
      extraFlags = "--node-ip ${cfg.ip} --node-external-ip ${cfg.ip} --advertise-address ${cfg.ip} --flannel-iface tailscale0";
    };

    environment.systemPackages = [ pkgs.k3s ];
  };
}
