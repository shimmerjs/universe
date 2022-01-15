{ pkgs, ... }:
{
  users.mutableUsers = false;

  users.users.shimmerjs = {
    isNormalUser = true;
    extraGroups = [ "root" "wheel" "networkmanager" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    home = "/home/shimmerjs";
  };
}
