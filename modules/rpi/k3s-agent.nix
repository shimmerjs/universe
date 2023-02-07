{ nodes, ... }:
# convenience wrapper to avoid poisoning modules/rpi with k3s
# since all of my pis are k3s nodes but all necessarily aren't
# assumes it is part of shimmerjs homestar2 hive
{
  imports = [
    ./default.nix
    <u/modules/k3s/agent.nix>
  ];

  services.k3s-agent = {
    server = nodes.rehab.config.services.k3s-server.ip;
  };
}
