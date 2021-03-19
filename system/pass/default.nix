{ pkgs, ... }:
{
  # various packages needed to get pass working in general and with
  # other programs (e.g., git)
  environment.systemPackages = with pkgs; [
    gnupg
    pass-secret-service
    pass
    gitAndTools.pass-git-helper
    pinentry-curses # allows headless gpg key generation
  ];
}
