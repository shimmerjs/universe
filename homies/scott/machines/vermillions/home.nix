# NCR development VM
{ pkgs, config, ... }:
let
  # import raw sources to use github sources
  sources = import <u/nix/sources.nix>;
  # import niv-managed pkgs overlay
  pkgs = import <u/nix> { inherit sources; };
in
{
  imports = [
    <u/modules/home-manager>
    <u/modules/home-manager/linux>
    <u/homies/scott/profiles/work>
  ];
}
