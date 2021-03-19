{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "okteto";
  version = "1.9.4";

  src = pkgs.fetchFromGitHub {
    inherit (sources.okteto) owner repo rev sha256;
  };

  doCheck = false;

  vendorSha256 = "1napxy3i4cy42hvz1lw5q07iyf1gxz0v87r1bfrmc82xp9ib44fj";

  meta = with pkgs.lib; {
    description = "Develop your applications directly in your Kubernetes Cluster";
    homepage = https://okteto.com;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
