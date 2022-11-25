# TODO: create fork of wally-cli that upgrades golang.org/x/sys to fix linkmode errors
{ sources ? import <u/nix/sources.nix>, pkgs ? import <u/nix> { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "wally-cli";
  version = "0.0.1";

  src = pkgs.fetchFromGitHub {
    inherit (sources.wally-cli) owner repo rev sha256;
  };

  buildInputs = with pkgs; [
    libusb
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  vendorSha256 = "1a18nml5z1qyrbbyfwi5rcx7zfqkpv8p4wym2lfz0w9zvlsjwr4v";

  meta = with pkgs.lib; {
    description = "The Flash(ing tool) CLI";
    homepage = https://github.com/zsa/wally-cli;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
