# personal crackbook
{ config, ... }:
let
  # import raw sources to use github sources
  sources = import ../../nix/sources.nix;
  # import niv-managed pkgs overlay
  pkgs = import ../../nix { inherit sources; };
in
{
  imports = [
    ../../home
    ../../home/git
    ../../home/ssh
    ../../nix/config
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
