{ config, lib, pkgs, ... }:
let
  # import raw sources to use github sources
  sources = import <u/nix/sources.nix>;
  # import niv-managed pkgs overlay
  pkgs = import <u/nix> { inherit sources; };
in
{
  imports = [
    <home-manager/nixos>

    <u/modules/nixos>
    <u/modules/nixos/dev>
    <u/modules/nixos/pass>

    ./vscode-server.nix
    ./container-registry.nix
    ./hardware
    ./yubikey.nix
  ];

  # shouldn't use this? doesnt seem to work for older x86 board
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;

  home-manager.users.shimmerjs = import ./home;

  # pretty sure this is going to be true for all my nixos boxes
  # but need to set up a couple more first before pulling into ../../nixos
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.device = "/dev/disk/by-uuid/18AA-4CFE";
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = "1048576";
  };

  # enable emulating aarch64 for building raspberry pi images
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  users.users.shimmerjs = {
    shell = pkgs.zsh;
  };

  # fetched this via `vagrant ssh-config`, should automate in future
  programs.ssh.extraConfig = ''
    Host edge-dev
      HostName 192.168.122.125
      User shimmerjs
      UserKnownHostsFile /dev/null
      StrictHostKeyChecking no
      PasswordAuthentication no
      IdentityFile /home/shimmerjs/.ssh/edge-dev
      IdentitiesOnly yes
      LogLevel FATAL
  '';
}
