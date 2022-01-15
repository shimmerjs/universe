{
  imports = [
    ./shimmerjs.nix
  ];

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
  };
}
