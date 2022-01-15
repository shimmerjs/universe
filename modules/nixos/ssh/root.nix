{
  users.extraUsers.root.openssh.authorizedKeys.keys = [
    (builtins.readFile ./keys/booninite.keys)
    (builtins.readFile ./keys/shimmerjs-key)
  ];
}
