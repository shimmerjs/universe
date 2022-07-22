# ssh config for connecting to my servers
{ pkgs, ... }:
{
  programs.ssh = {
    extraConfig = ''
      Host herqtail
        HostName herq
        User shimmerjs

      Host herq
        HostName 192.168.1.226
        User shimmerjs

      Host herqmo
        HostName 99.132.141.3
        User shimmerjs

      Host edge-devmo
        HostName 192.168.122.125
        User shimmerjs
        ForwardAgent yes
        ProxyJump shimmerjs@herqmo
        UserKnownHostsFile /dev/null
        StrictHostKeyChecking no
        PasswordAuthentication no
        IdentityFile ~/.ssh/edge-dev
        IdentitiesOnly yes
        LogLevel FATAL
      
      Host edge-dev
        HostName 192.168.122.125
        User shimmerjs
        ForwardAgent yes
        ProxyJump shimmerjs@herq
        UserKnownHostsFile /dev/null
        StrictHostKeyChecking no
        PasswordAuthentication no
        IdentityFile ~/.ssh/edge-dev
        IdentitiesOnly yes
        LogLevel FATAL
    '';
  };
}
