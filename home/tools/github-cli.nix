{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "github-cli";
  version = "0.0.1";

  src = pkgs.fetchFromGitHub {
    owner = sources.github-cli.owner;
    repo = sources.github-cli.repo;
    rev = sources.github-cli.rev;
    sha256 = sources.github-cli.sha256;
  };

  subPackages = [ "cmd/gh" ];

  vendorSha256 = "12ka5x5m4h8dfpcdhfjc5lz6bm8pzfqkbhs9j3a8w08xsi93dvdz";

  meta = with pkgs.lib; {
    description = "Join GitHub in taking over the free world.";
    homepage = https://github.com/cli/cli;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
