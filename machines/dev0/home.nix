# NCR workbook
{ pkgs, config, ... }:
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
  ];

  programs.git = {
    enable = true;
    userName = "alex weidner";
    extraConfig = {
      credential = {
        helper = "!$(which gh) auth git-credential";
      };
      include = {
        path = "~/.config/git/ncr";
      };
      pull = {
        rebase = false;
      };

      core = {
        editor = "vim";
      };
    };
  };

  # TODO: clean up, this is duped from home/git/ncr
  home.file.".config/git/ncr".text = builtins.readFile ../../home/git/ncr/gitconfig;
  home.packages = with pkgs; [
    gitAndTools.git-crypt
  ];
}
