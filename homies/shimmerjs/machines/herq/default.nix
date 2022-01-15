{ config, lib, pkgs, ... }:
let
  # k3s cluster configuration
  cluster = import <u/modules/k3s/cluster.nix>;
  k3sServerPath = (import <u/modules/k3s/constants.nix>).server.tokenDir;
in
{
  imports = [
    ./vscode-server.nix
    ./hardware
    ./yubikey.nix
    <home-manager/nixos>
    <u/modules/nixos>
    <u/modules/nixos/dev>
    <u/modules/nixos/pass>
    <u/modules/nixos/networking/eno1.nix>
    <u/modules/k3s/server.nix>
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

  # enable emulating aarch64 for building raspberry pi images
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  services.k3s-server = {
    ip = "100.105.221.15";
  };

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

  system.activationScripts = {
    # allow easier management of k3s token files 
    k3s.text = ''
      chown -R shimmerjs $(dirname ${k3sServerPath})
    '';
  };
}
