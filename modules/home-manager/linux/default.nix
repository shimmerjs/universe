{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gccStdenv
    gcc
    gnumake
  ];
}
