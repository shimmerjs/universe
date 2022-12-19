# ssh config for connecting to my servers
{ pkgs, ... }:
{
  programs.ssh = {
    extraConfig = ''
      Host verm
        HostName 192.168.1.104
        User scott

      Host vermo
        HostName 107.13.151.122
        Port 32419
        User scott

      Host kraken
        HostName 192.168.1.145
        User scott

      Host pi
        HostName 192.168.1.194
        User pi
    '';
  };
}