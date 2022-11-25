# home-manager config specific to this homie, should be imported by all 
# home-manager configs for dis homie
{ pkgs, ... }:
{
  # either we are in OSX and you are using home-manager without sudo, or 
  # we are in nixOS and the requirement on sudo for nixos-rebuild switch 
  # makes the value of $USER incorrect.  I use shimmerjs across all non-OSX boxes
  home.username = if pkgs.stdenv.isDarwin then builtins.getEnv "USER" else "shimmerjs";
  home.homeDirectory = if pkgs.stdenv.isDarwin then builtins.getEnv "HOME" else "/home/shimmerjs";
  home.stateVersion = "21.03";
}
