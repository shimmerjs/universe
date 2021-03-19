let
  # import raw sources to use github sources
  sources = import ../../nix/sources.nix;
  # import niv-managed pkgs overlay
  pkgs = import ../../nix { inherit sources; };
in
{
  # git isnt exported for convenience because it varies
  imports = [
    ./home-manager
    ./kitty
    ./tools
    ./vscode
    ./zsh
  ];
}
