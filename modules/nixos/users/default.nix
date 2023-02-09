{ pkgs, ... }:
{
  users.mutableUsers = false;

  users.users.shimmerjs = {
    isNormalUser = true;
    extraGroups = [ "root" "wheel" "networkmanager" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    home = "/home/shimmerjs";
  };

  users.users.nateph = {
    isNormalUser = true;
    extraGroups = [ "root" "wheel" "networkmanager" "docker" ];
    home = "/home/nateph";
  };
}
