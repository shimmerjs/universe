let
  sources = import ./nix/sources.nix;
  # overlay niv managed nixpkgs so that home-manager uses it
  pkgs = import sources.nixpkgs {
    overlays = [
      (_: _: { inherit sources; })
    ];
  };
in
pkgs.mkShell rec {
  name = "home-manager-shell";

  buildInputs = with pkgs; [
    niv
    gitAndTools.git-crypt
    (import sources.home-manager { inherit pkgs; }).home-manager
  ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${sources.nixpkgs}:home-manager=${sources.home-manager}:nixos-config=/home/shimmerjs/dev/shimmerjs/files-i-need/machines/herq/configuration.nix"
  '';

}
