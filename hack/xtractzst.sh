#!/usr/bin/env bash

# usage: xtractzst path_to_my_zst.zst <output file name>
# defaults to iso.img if an output file name isn't provided
# ---
# extracts .zst files produced by NixOS ISO build proces into 
# .img files we can work with

set -ue

nix-shell -p zstd --run "unzstd -f $1 -o ${2:-"iso.img"}"