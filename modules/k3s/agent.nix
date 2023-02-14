{ config, lib, pkgs, ... }:
let
  cfg = config.services.k3s-agent;
in
with lib;
{
  options = {
    services.k3s-agent = {
      ip = mkOption {
        default = "";
        type = with types; uniq string;
        description = ''
          The advertised K8s node IP
        '';
      };

      server = mkOption {
        default = "";
        type = with types; uniq string;
        description = ''
          K3s server node address
        '';
      };
    };
  };

  imports = [
    ./deployment-secrets.nix
  ];

  config = {
    services.k3s = {
      enable = true;
      role = "agent";
      serverAddr = "https://${cfg.server}:6443";
      tokenFile = (import ./constants.nix).agent.tokenFile;
      extraFlags = "--node-ip ${cfg.ip} --node-external-ip ${cfg.ip} --flannel-iface tailscale0 --flannel-backend=host-gw";
    };

    environment.systemPackages = [ pkgs.k3s ];
  };
}
