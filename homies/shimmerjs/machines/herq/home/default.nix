{ pkgs, ... }:
{
  imports = [
    <u/modules/home-manager>
    <u/homies/shimmerjs/home-manager.nix>
    ./git.nix
  ];

  home.packages = with pkgs; [
    ssh-import-id
    # nixos fleet management tool
    colmena
  ];
}
