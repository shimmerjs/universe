{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host herq
        HostName 192.168.1.226
        User shimmerjs
      
      Host edge-dev
        HostName 192.168.121.196
        User vagrant
        ProxyJump shimmerjs@herq
        UserKnownHostsFile /dev/null
        StrictHostKeyChecking no
        PasswordAuthentication no
        IdentityFile /home/shimmerjs/dev/ncr/vagrant/.vagrant/machines/default/libvirt/private_key
        IdentitiesOnly yes
        LogLevel FATAL
    '';
  };
}
