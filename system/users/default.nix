{ pkgs, ... }:
{
  users.mutableUsers = false;

  users.users.shimmerjs = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/shimmerjs";
    shell = pkgs.zsh;
  };

  users.users.scott = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/scott";
    shell = pkgs.zsh;
  };

  users.users.david = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/david";
    shell = pkgs.zsh;
  };
}
