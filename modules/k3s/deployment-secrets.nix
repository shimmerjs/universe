# reusable module for k3s nodes that I manage using colmena
# provides the required node token for authenticating to the k3s 
# server
let
  constants = import ./constants.nix;
in
{
  deployment = {
    tags = [ "k3s-agent" ];
    keys = {
      "node-token" = {
        keyFile = constants.server.tokenFile;

        destDir = constants.agent.tokenDir;

        group = "root";
        user = "shimmerjs";
        permissions = "0600";

        uploadAt = "pre-activation";
      };
    };
  };
}
