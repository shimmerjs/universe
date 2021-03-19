{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "kpt";
  version = "0.36.1";

  src = pkgs.fetchFromGitHub {
    inherit (sources.kpt) owner repo rev sha256;
  };

  subPackages = [ "." ];

  vendorSha256 = "06kx85bf8mjmyhz5gp0la4fr8psnfz6i2rchc22sz2pgmsng1dfr";

  meta = with pkgs.lib; {
    description = "kpt is a toolkit to help you manage, manipulate, customize, and apply Kubernetes Resource configuration data files.";
    homepage = https://googlecontainertools.github.io/kpt;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
