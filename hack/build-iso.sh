#!/usr/bin/env bash

# usage: build-iso.sh rpi64 hostname
# ---
# builds the correct NixOS ISO / bootable install media
# based on the first argument.  the hostname is passed to the 
# iso build so that the machine comes up with the expected hostname
# for first boot + tailscale registration

set -eu

pushd "$UNIVERSE_HOME"

source .env

TYPE="${1:-standard}"
ISO_HOSTNAME="${2:-""}"
ISO="$UNIVERSE_HOME/modules/iso"
RPI64="$ISO/raspberrypi-aarch64"

CMD="nix-build '<nixpkgs/nixos>' -A config.system.build"

if [ "$ISO_HOSTNAME" == "" ]; then
  echo "hostname for ISO must be provided"
  exit 1
fi

if [ "$TYPE" == "standard" ];then
  CMD="$CMD.isoImage -I nixos-config=$ISO"
elif [ "$TYPE" == "rpi64" ];then
  CMD="$CMD.sdImage -I nixos-config=$RPI64 --argstr system aarch64-linux"
else 
  echo "Couldn't determine type, idk read the script"
  exit 1
fi

CMD="export HOSTNAME=$ISO_HOSTNAME; $CMD --out-link $DISTDIR/$ISO_HOSTNAME"

echo "$CMD"

mkdir -p $DISTDIR
nix-shell --run "$CMD"
popd