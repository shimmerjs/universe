# herq-specific git related configuration
{ pkgs, ... }:
{
  # domain mapping so credential helper knows which secret in `pass` to use 
  home.file.".config/pass-git-helper/git-pass-mapping.ini".text = ''
    # default to personal    
    [github.com/*]
      target=dev/github/booninite

    [github.com/ncr-swt-*]
      target=dev/github/ncr
  '';
  # configure a pinentry program so that i can generate a key with gpg
  # - get exact install location so git doesnt do any path nonsense itself
  # - increase TTL so im not prompted for pass phrase constantly
  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry-curses}/bin/pinentry-curses
    default-cache-ttl 34560000
    max-cache-ttl 34560000
  '';
}
