#!/usr/bin/env bash

# https://nixos.org/manual/nix/stable/installation/upgrading.html
nix-channel --update; nix-env --install --attr nixpkgs.nix nixpkgs.cacert