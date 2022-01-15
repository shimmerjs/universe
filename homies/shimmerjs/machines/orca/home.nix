# personal crackbook
{ config, ... }:
let
  # import raw sources to use github sources
  sources = import <u/nix/sources.nix>;
  # import niv-managed pkgs overlay
  pkgs = import <u/nix> { inherit sources; };
in
{
  imports = [
    <u/modules/home-manager>
    <u/modules/home-manager/ssh>
    <u/modules/home-manager/osx>
    <u/homies/shimmerjs/home-manager.nix>
  ];

  home.sessionVariables = {
    KUBECONFIG = "${config.home.homeDirectory}/dev/homestar/kubeconfig";
  };

  programs.ssh.extraConfig = ''
    Host github.com
      User git
      Port 22
      HostName github.com
      PreferredAuthentications publickey
      IdentityFile /Users/shimmerjs/.ssh/booninite
  '';
}
