#!/bin/sh

# usage:
# ---
# runs gen-vscode-extensions.sh and pipes it to a specific homies extensions.nix

set -eu

"$(dirname "${BASH_SOURCE[0]}")/gen-vscode-extensions.sh" | tee "$UNIVERSE_HOME/modules/home-manager/vscode/extensions.nix"
nixpkgs-fmt "$UNIVERSE_HOME/modules/home-manager/vscode/extensions.nix"