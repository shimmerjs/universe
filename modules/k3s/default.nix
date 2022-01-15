{ pkgs, ... }:
{
  services.k3s.enable = true;
  environment.systemPackages = [ pkgs.k3s ];
}
