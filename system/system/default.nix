{ pkgs, ... }:
{
  system.stateVersion = "21.03"; # Did you read the comment?

  time.timeZone = "America/New_York";

  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    vagrant
  ];
}
