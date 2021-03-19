{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "jfrog-cli";
  version = "0.0.1";

  src = pkgs.fetchFromGitHub {
    owner = sources.jfrog-cli.owner;
    repo = sources.jfrog-cli.repo;
    rev = sources.jfrog-cli.rev;
    sha256 = sources.jfrog-cli.sha256;
  };

  vendorSha256 = "0lwv6zs9v6fzfq81pikcig5l2nhx1a94f0zhwfjqf6qhy9wi44a9";

  # because the test relies on some .git/ dir that isnt present in nix build phase
  doCheck = false;

  meta = with pkgs.lib; {
    description = "JFrog CLI is a client that provides a simple interface that automates access to the JFrog products.";
    homepage = https://github.com/jfrog/jfrog-cli;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
