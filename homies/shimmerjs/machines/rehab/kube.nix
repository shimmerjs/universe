{ pkgs, ... }:
let
  k3sServerPath = (import <u/modules/k3s/constants.nix>).server.tokenDir;
in
{
  imports = [
    <u/modules/k3s/server.nix>
  ];

  services.k3s-server = {
    ip = "100.70.218.28";
  };

  # honor existing KUBECONFIG and add the servers config
  environment.sessionVariables = {
    KUBECONFIG = "$KUBECONFIG:/etc/rancher/k3s/k3s.yaml";
  };

  system.activationScripts = {
    # allow easier management of k3s token files 
    k3s.text = ''
      chown -R shimmerjs $(dirname ${k3sServerPath})
    '';
  };
}
