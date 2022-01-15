{ sources ? import <u/nix/sources.nix>, pkgs ? import <u/nix> { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "crane";
  version = "0.0.1";

  src = pkgs.fetchFromGitHub {
    inherit (sources.go-containerregistry) owner repo rev sha256;
  };

  subPackages = [ "cmd/crane" ];

  vendorSha256 = null;

  meta = with pkgs.lib; {
    description = "Go library and CLIs for working with container registries";
    homepage = https://github.com/google/go-containerregistry;
    license = licenses.asl20;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
