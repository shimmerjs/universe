{ pkgs, ... }:
let
  k3sServerPath = (import <u/modules/k3s/constants.nix>).server.tokenDir;
  minioRootCredsFile = "/etc/minio/root-creds-dont-look";
in
{
  imports = [
    <u/modules/k3s/server.nix>
  ];

  services.k3s-server = {
    ip = "100.105.221.15";
  };

  # honor existing KUBECONFIG and add the servers config
  environment.sessionVariables = {
    KUBECONFIG = "$KUBECONFIG:/etc/rancher/k3s/k3s.yaml";
  };

  # set up minio off-cluster for configuration storage, 
  # will be applied to cluster via Flux.
  # set up off-cluster to avoid lifecycle footguns
  services.minio = {
    enable = true;
    browser = false;
    listenAddress = ":21700";
    rootCredentialsFile = minioRootCredsFile;
  };

  environment.systemPackages = [
    pkgs.minio-client
  ];

  system.activationScripts = {
    # allow easier management of k3s token files 
    k3s.text = ''
      chown -R shimmerjs $(dirname ${k3sServerPath})
      chown -R shimmerjs $(dirname ${minioRootCredsFile})
    '';
  };
}
