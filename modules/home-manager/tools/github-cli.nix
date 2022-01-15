{ sources ? import <u/nix/sources.nix>, pkgs ? import <u/nix> { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "github-cli";
  version = "1.8.1";

  src = pkgs.fetchFromGitHub {
    owner = sources.github-cli.owner;
    repo = sources.github-cli.repo;
    rev = sources.github-cli.rev;
    sha256 = sources.github-cli.sha256;
  };

  subPackages = [ "cmd/gh" ];

  vendorSha256 = "0j2jy7n7hca5ybwwgh7cvm77j96ngaq1a1l5bl70vjpd8hz2qapc";

  meta = with pkgs.lib; {
    description = "Join GitHub in taking over the free world.";
    homepage = https://github.com/cli/cli;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
