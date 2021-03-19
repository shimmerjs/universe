{
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
  };

  users.users.shimmerjs = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/shimmerjs-key)
      (builtins.readFile ./keys/alex-ncr-key)
    ];
  };
}
