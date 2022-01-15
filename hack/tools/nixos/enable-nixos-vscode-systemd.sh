#!/usr/bin/env bash

# https://nixos.wiki/wiki/Visual_Studio_Code#Remote_SSH
# https://github.com/msteen/nixos-vscode-server
# ---
# this script must be ran after the configuration is applied to 
# the NixOS host running the vscode server (see herq/vscode-server.nix).


systemctl --user enable auto-fix-vscode-server.service