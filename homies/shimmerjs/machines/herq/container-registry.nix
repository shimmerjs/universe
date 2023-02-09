{ ... }:
{
  services.dockerRegistry = {
    enable = true;
    enableDelete = true;
    port = 21700;
    listenaddress = "0.0.0.0";
    storagePath = "/opt/dev/registry";
  };
}
