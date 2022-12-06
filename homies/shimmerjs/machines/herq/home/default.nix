{ pkgs, ... }:
{
  imports = [
    <u/modules/home-manager>
    <u/homies/shimmerjs/home-manager.nix>
    <u/homies/shimmerjs/profiles/play>
    ./git.nix
    ./colmena.nix
  ];

  manual.manpages.enable = false;

  home.packages = with pkgs; [
    ssh-import-id
  ];
}
