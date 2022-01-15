let
  # TODO: should be a more elegant way to do this but i am 
  #       big suck at nix language
  tokenFile = "node-token";
  agentTokenDir = "/var/lib/k3s";
  serverTokenDir = "/var/lib/rancher/k3s/server";
in
{
  agent = {
    tokenDir = agentTokenDir;
    tokenFile = "${agentTokenDir}/${tokenFile}";
  };

  server = {
    tokenDir = serverTokenDir;
    tokenFile = "${serverTokenDir}/${tokenFile}";
  };
}
