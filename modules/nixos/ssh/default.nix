{
  imports = [
    ./shimmerjs.nix
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };
}
