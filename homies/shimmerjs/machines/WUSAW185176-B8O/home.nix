# NCR workbook
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
    <u/modules/home-manager/osx>
    <u/modules/home-manager/ssh>
    <u/homies/shimmerjs/ssh.nix>
    <u/homies/shimmerjs/profiles/work>
  ];

  # set up machine specific kitty ssh-conf
  home.file.".config/kitty/ssh.conf".source = ./ssh.conf;
}
