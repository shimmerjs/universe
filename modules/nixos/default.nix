{
  imports = [
    ./ssh
    ./users
    ./security
    ./networking
  ];

  # i am always allow to do nix stuff on my own machines
  # TODO: parameterize (module?)
  nix = {
    settings = {
      allowed-users = [ "shimmerjs" ];
      trusted-users = [ "root" "shimmerjs" ];
    };
  };

  time.timeZone = "America/New_York";

  system.stateVersion = "22.05"; # Did you read the comment?
}
