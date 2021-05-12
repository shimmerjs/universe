{
  imports = [
    ../../../home
    ../../../home/git/ncr
    ../../../nix/config
    ./git.nix
    ./dazel.nix
  ];

  home.file.".docker/config.json".text = ''
    {
      "auths": {
        "ncr-emeraldedge-docker-dev.jfrog.io": {}
      },
      "HttpHeaders": {
        "User-Agent": "Docker-Client/19.03.14 (linux)"
      },
      "credsStore": "pass" 
    }
  '';

  # fetched this via `vagrant ssh-config`, should automate in future
  programs.ssh.extraConfig = ''
    Host edge-dev
      HostName 192.168.121.193
      User vagrant
      Port 22
      UserKnownHostsFile /dev/null
      StrictHostKeyChecking no
      PasswordAuthentication no
      IdentityFile /home/shimmerjs/dev/ncr/edge-infra/.vagrant/machines/default/libvirt/private_key
      IdentitiesOnly yes
      LogLevel FATAL
  '';
}
