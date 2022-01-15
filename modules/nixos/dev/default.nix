# NixOS configuration you will probably want if you are
# going to be developing on the box.
{
  imports = [
    ./docker
    ./universe.nix
  ];
}
