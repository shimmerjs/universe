# home-manager config specific to this homie but used 
# across multiple machines
{ pkgs, ... }:
{
  # either we are in OSX and you are using home-manager without sudo, or 
  # we are in nixOS and the requirement on sudo for nixos-rebuild switch 
  # makes the value of $USER incorrect.  I use scott across all non-OSX boxes
  home.username = if pkgs.stdenv.isDarwin then builtins.getEnv "USER" else "scott";
  home.homeDirectory = if pkgs.stdenv.isDarwin then builtins.getEnv "HOME" else "/home/scott";
  home.stateVersion = "21.03";

  # git identity
  programs.git = {
    userName = "scott shuffler";
    userEmail = "scottshuffler@gmail.com";
  };
}
