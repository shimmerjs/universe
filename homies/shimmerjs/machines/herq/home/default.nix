{ pkgs, ... }:
{
  imports = [
    <u/modules/home-manager>
    <u/homies/shimmerjs/home-manager.nix>
    <u/homies/shimmerjs/profiles/play>
    ./git.nix
    ./colmena.nix
  ];

  home.packages = with pkgs; [
    ssh-import-id
  ];
}
