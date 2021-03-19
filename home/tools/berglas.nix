{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
pkgs.buildGoModule rec {
  pname = "berglas";
  version = "0.0.1";

  src = pkgs.fetchFromGitHub {
    owner = sources.berglas.owner;
    repo = sources.berglas.repo;
    rev = sources.berglas.rev;
    sha256 = sources.berglas.sha256;
  };

  subPackages = [ "." ];

  vendorSha256 = "057gkl3cim86d8z40qms7hf0l5igpqz4n8jg17vg9dixfjazfb26";

  meta = with pkgs.lib; {
    description = "A tool for managing secrets on Google Cloud";
    homepage = cloud.google.com/secret-manager;
    # license = licenses.mit;
    # maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
