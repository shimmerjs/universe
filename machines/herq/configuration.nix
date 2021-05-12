{ config, lib, ... }:
let
  # import raw sources to use github sources
  sources = import ../../nix/sources.nix;
  # import niv-managed pkgs overlay
  pkgs = import ../../nix { inherit sources; };
in
{
  imports = [
    ./hardware
    "${sources.home-manager}/nixos"
    ../../system
  ];

  home-manager.users.shimmerjs = import ./home;

  # pretty sure this is going to be true for all my nixos boxes
  # but need to set up a couple more first before pulling into ../../nixos
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.device = "/dev/disk/by-uuid/18AA-4CFE";
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = "1048576";
  };

  networking.hostName = "herq";

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
