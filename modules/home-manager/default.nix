{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    <u/nix/config>

    ./kitty
    ./tools
    ./zsh
    ./git
  ];
}
