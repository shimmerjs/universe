{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "kpt";
  version = "0.39.1";

  src = pkgs.fetchFromGitHub {
    inherit (sources.kpt) owner repo rev sha256;
  };

  subPackages = [ "." ];

  vendorSha256 = "1w8qgg49ijcsgrscq7c0qk4bwxkxfm0jlch7p9j74g4sc4737wgl";

  meta = with pkgs.lib; {
    description = "kpt is a toolkit to help you manage, manipulate, customize, and apply Kubernetes Resource configuration data files.";
    homepage = https://googlecontainertools.github.io/kpt;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
