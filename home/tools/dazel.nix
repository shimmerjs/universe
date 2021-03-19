{ sources ? import ../../nix/sources.nix, pkgs ? import ../../nix { inherit sources; } }:
# { lib, buildPythonPackage, fetchPypi }:
pkgs.python3.pkgs.buildPythonPackage rec {
  pname = "dazel";
  version = "0.0.38";

  src = pkgs.python3.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "0acy1q871pi17sz8158n3zylcm4s2v8k16pl22cyv9s3lq25pbi7";
  };

  doCheck = false;

  meta = with pkgs.lib; {
    homepage = "https://github.com/nadirizr/dazel";
    description = "Run Google's bazel inside a docker container via a seamless proxy.";
    license = licenses.mit;
  };
}
