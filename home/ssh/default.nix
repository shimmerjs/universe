{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host herq
        HostName 192.168.1.226
        User shimmerjs
      
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
