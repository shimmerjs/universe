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
    <u/homies/shimmerjs/home-manager.nix>
  ];

  # duped some stuff from profiles/work/...
  # TODO: can't just import homies/shimmerjs/profiles/work bc of difference in 
  #       git config
  programs.zsh.sessionVariables = {
    GOPRIVATE = "github.com/ncr-swt-retail,edge-infra.dev";
  };

  programs.git = {
    userName = "alex weidner";
    extraConfig = {
      include = {
        path = "~/.config/git/workgitconfig";
      };
    };
  };

  home.file.".config/git/workgitconfig".text = builtins.readFile ./gitconfig;
  home.packages = with pkgs; [
    # clout
    google-cloud-sdk
    gitAndTools.git-crypt
  ];
}
