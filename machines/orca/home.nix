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
    ../../git
    ../../nix/config
  ];

  home.sessionVariables = {
    KUBECONFIG = "${config.home.homeDirectory}/dev/homestar/kubeconfig";
  };
}
