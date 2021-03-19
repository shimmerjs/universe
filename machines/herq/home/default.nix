{ pkgs, ... }:
{
  imports = [
    ../../../home
    ../../../home/git/ncr
    ../../../nix/config
    ./git.nix
    ./dazel.nix
  ];

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    tdesktop
    ssh-import-id
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
