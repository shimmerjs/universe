homies := "dakale scottshuffler booninite"

build hostname=`hostname`:
  #!/usr/bin/env bash
  if [ {{os()}} == "macos" ]; then
    nix-shell --run "home-manager -f machines/{{hostname}}/home.nix build -v"
  else
    # must be nixos
    nix-shell --run "nixos-rebuild build --show-trace"
  fi

unlock:
  nix-shell --run "git-crypt unlock crypt.key"

switch hostname=`hostname`:
  #!/usr/bin/env bash
  if [ {{os()}} == "macos" ]; then
    nix-shell --run "home-manager -f machines/{{hostname}}/home.nix switch"
  else
    # must be nixos
    sudo nix-shell --run "nixos-rebuild switch"
  fi

update-hardware-configuration hostname=`hostname`:
  nixos-generate-config --show-hardware-config > machines/{{hostname}}/hardware/default.nix

update-ssh-keys:
  for homie in {{homies}}; do curl https://github.com/$homie.keys -o system/ssh/keys/$homie.keys; done