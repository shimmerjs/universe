# only explicitly set NIX_PATH on NixOS dev boxes because
# otherwise we are applying via colmena remotely
{ ... }:
let
  universe = builtins.getEnv "UNIVERSE_HOME";
  sources = import <u/nix/sources.nix>;
in
{
  nix.nixPath = [
    "nixpkgs=${sources.nixpkgs}"
    "home-manager=${sources.home-manager}"
    "u=${universe}"
  ];
}
