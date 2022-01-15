#!/usr/bin/env bash

set -eu

# BISONC - Build ISO 'N Copy
# When you're a lazy fuck who won't learn how to do things properly
# TODO: remote building against herq using NixOS primitives

source .env

BUILDER_UNIVERSE_HOME="/home/shimmerjs/dev/universe"
BUILDER="herq"
HOSTNAME="$2"
ISO_DIR="$DISTDIR/nixos-pi-iso"
ZST_FILE="$ISO_DIR/$HOSTNAME.zst"
IMG_FILE="$ISO_DIR/$HOSTNAME.img"

echo "building..."
ssh "$BUILDER" "$BUILDER_UNIVERSE_HOME/hack/build-iso.sh $1 $HOSTNAME"
echo "copying..."
rsync -avhi --progress "$BUILDER":"$BUILDER_UNIVERSE_HOME/$DISTDIR/$HOSTNAME/sd-image/nixos-sd-image-22.05pre-git-aarch64-linux.img.zst" "$ZST_FILE"
echo "extracting..."
hack/xtractzst.sh "$ZST_FILE" "$IMG_FILE"