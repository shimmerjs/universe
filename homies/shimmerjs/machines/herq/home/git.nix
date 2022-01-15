# herq-specific git related configuration
# TODO: make a module so others can use
{ pkgs, ... }:
{
  # domain mapping so credential helper knows which secret in `pass` to use 
  home.file.".config/pass-git-helper/git-pass-mapping.ini".text = ''
    [github.com]
      target=dev/github/booninite
  '';
  # configure a pinentry program so that i can generate a key with gpg
  # - get exact install location so git doesnt do any path nonsense itself
  # - increase TTL so im not prompted for pass phrase constantly
  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry-curses}/bin/pinentry-curses
    default-cache-ttl 34560000
    max-cache-ttl 34560000
  '';

  programs.git = {
    extraConfig = {
      credential = {
        helper = "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper";
      };
    };
  };
}
