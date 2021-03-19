{ pkgs, ... }:
{
  users.mutableUsers = false;

  users.users.shimmerjs = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/shimmerjs";
    shell = pkgs.zsh;
  };
}
