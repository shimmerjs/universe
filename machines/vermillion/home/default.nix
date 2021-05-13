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
}
