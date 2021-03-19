{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
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

  vendorSha256 = "1g7xjjydag712fhq7xh08swld5bqj0g47nmisrp74r2gmqw5d468";

  meta = with pkgs.lib; {
    description = "The Flash(ing tool) CLI";
    homepage = https://github.com/zsa/wally-cli;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
