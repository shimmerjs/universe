# NCR workbook
{ config, ... }:
let
  # import raw sources to use github sources
  sources = import ../../nix/sources.nix;
  # import niv-managed pkgs overlay
  pkgs = import ../../nix { inherit sources; };
in
{
  imports = [
    ../../nix/config
    ../../home
    ../../home/ssh
    ../../home/git/ncr
  ];

  programs.git.extraConfig = {
    # use my personal identity my person
    includeIf."gitdir:~/dev/" = {
      path = "~/.config/git/js";
    };
    # use work identity for work
    includeIf."gitdir:~/dev/ncr/" = {
      path = "~/.config/git/ncr";
    };
  };
}
