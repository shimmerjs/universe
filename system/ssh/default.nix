{
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
  };

  users.users.shimmerjs = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/shimmerjs-key)
      (builtins.readFile ./keys/alex-ncr-key)
      (builtins.readFile ./keys/booninite.keys)
    ];
  };

  users.users.david = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/dakale.keys)
    ];
  };

  users.users.scott = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/scottshuffler.keys)
    ];
  };
}
