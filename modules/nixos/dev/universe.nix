{
  # set this as a system-wide session variable for NixOS systems so that its
  # available as root when calling `sudo nix-shell --run "nixos-rebuild switch"
  environment.sessionVariables = {
    UNIVERSE_HOME = "$HOME/dev/universe";
  };
}
