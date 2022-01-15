#!/usr/bin/env bash
# used for installing nix on non-NixOS hosts

set -eu
source .env

echo "installing nix@$NIX_VERSION"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  FLAGS="--daemon"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  FLAGS="--darwin-use-unencrypted-nix-store-volume"
else
  echo "shit man idk u out there on some stuff"
  exit 1
fi


sh <(curl -L https://releases.nixos.org/nix/nix-$NIX_VERSION/install) "$FLAGS"
