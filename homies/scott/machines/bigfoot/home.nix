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
    <u/modules/home-manager/ssh>
    <u/modules/home-manager/osx>
    <u/homies/scott/profiles/work>
    <u/homies/scott/ssh.nix>
  ];
}
