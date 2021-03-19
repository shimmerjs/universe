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

  programs.zsh.sessionVariables = {
    GOPRIVATE = "github.com/ncr-swt-retail";
  };

  programs.git.extraConfig = {
    # use my personal identity my person
    includeIf."gitdir:~/dev/shimmerjs/" = {
      path = "~/.config/git/shimmerjs";
    };
    # use work identity for work
    includeIf."gitdir:~/dev/ncr/" = {
      path = "~/.config/git/ncr";
    };
  };
}
