{ sources ? import <u/nix/sources.nix>, pkgs ? import <u/nix> { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "github-cli";
  version = "2.12.1";

  src = pkgs.fetchFromGitHub {
    owner = sources.github-cli.owner;
    repo = sources.github-cli.repo;
    rev = sources.github-cli.rev;
    sha256 = sources.github-cli.sha256;
  };

  subPackages = [ "cmd/gh" ];

  vendorSha256 = "0llxx9pm4xxiqf1pbqnwdh2s2r733kdkcqqk9m8q59bclqwmswpr";

  meta = with pkgs.lib; {
    description = "Join GitHub in taking over the free world.";
    homepage = https://github.com/cli/cli;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
