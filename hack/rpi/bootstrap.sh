#!/usr/bin/env bash

set -euo pipefail

IP="$IP"
HOSTNAME="$HOSTNAME"
MACHINE_PATH="$UNIVERSE_HOME/machines/$HOSTNAME"

echo "setting up tailscale..."
ssh root@$IP "sudo tailscale up"
ssh root@$IP "tailscale ip -4"

# TODO: hardcode less pats
echo "copying initial configuration over..."
rsync --mkpath -r system root@$IP:/bootstrap 
rsync hack/rpi/configuration.nix root@$IP:/etc/nixos/configuration.nix
rsync modules/rpi/hardware-configuration.nix root@$IP:/etc/nixos/hardware-configuration.nix

echo "finishing nixos install"
ssh root@$IP "export HOSTNAME=$HOSTNAME; nixos-install --root / --no-root-password"