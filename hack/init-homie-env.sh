#!/usr/bin/env bash
# creates .user.env

set -eu

HOMIE="${HOMIE:-"$(whoami)"}"

tee .user.env <<EOF
HOMIE="$HOMIE"
EOF