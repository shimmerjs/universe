{ universe ? builtins.getEnv "UNIVERSE_HOME" }:
let
  sources = import ./nix/sources.nix;
  # ensure our shell uses our pinned nixpkgs
  pkgs = import ./nix { inherit sources; };
  # TODO: more gracefully
  colmena = if pkgs.stdenv.isLinux then [ pkgs.colmena ] else [ ];
in
pkgs.mkShell rec {
  name = "universe";

  buildInputs = with pkgs; [
    niv
    gitAndTools.git-crypt
    (import sources.home-manager { inherit pkgs; }).home-manager
  ] ++ colmena;

  # setup NIX_PATH with prefixes:
  # - <nixpkgs>:      our pinned nixpkgs (managed by niv)
  # - <home-manager>: pinned home-manager install, prefix is 
  #                   needed by some home-manager config/modules
  # - <u>:            this repository, so that modules can be imported without
  #                   relative paths
  shellHook = ''
    export NIX_PATH="nixpkgs=${sources.nixpkgs}:home-manager=${sources.home-manager}:u=${universe}"
  '';
}
