{ pkgs, ... }:
{
  imports = [
    <u/modules/home-manager>
    <u/homies/shimmerjs/home-manager.nix>
    <u/homies/shimmerjs/profiles/play>
    ./git.nix
    ./colmena.nix
  ];

  # shouldn't be needed, but still having issues on
  # nixos hosts?
  # https://github.com/nix-community/home-manager/issues/3342
  manual.manpages.enable = false;

  home.packages = with pkgs; [
    ssh-import-id
  ];
}
