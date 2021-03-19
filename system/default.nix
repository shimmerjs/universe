{
  imports = [
    ./ssh
    ./users
    ./system
    ./security
    ./networking
    # these should be broken out into a system/dev module to avoid 
    # adding dev tools to node boxes
    ./docker
    ./pass
  ];

  # i am always allow to do nix stuff on my own machines
  nix = {
    allowedUsers = [ "shimmerjs" ];
    trustedUsers = [ "root" "shimmerjs" ];
  };
}
