{
  users.users.shimmerjs = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/shimmerjs-key)
      (builtins.readFile ./keys/alex-ncr-key)
      (builtins.readFile ./keys/booninite.keys)
    ];
  };

  users.users.nateph = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/n8-key)
    ];
  };
}
