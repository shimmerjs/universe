# herq-specific colmena shell related configuration
# TODO: make a module so others can use
{ pkgs, ... }:
{
  programs.zsh = {
    shellGlobalAliases = {
      c = "colmena -f $UNIVERSE_HOME/homies/shimmerjs/cluster.nix";
    };
  };
  home.packages = with pkgs; [
    # nixos fleet management tool
    colmena
  ];
}
