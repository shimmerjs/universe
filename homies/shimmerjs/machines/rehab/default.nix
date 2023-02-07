{ config, lib, pkgs, ... }:
let
  # import raw sources to use github sources
  sources = import <u/nix/sources.nix>;
  # import niv-managed pkgs overlay
  pkgs = import <u/nix> { inherit sources; };
in
{
  imports = [
    <u/modules/nixos>
    <u/modules/nixos/pass>
    <u/modules/nixos/networking/eno1.nix>

    # ./kube.nix
    ./hardware
  ];

  # home-manager.users.shimmerjs = import ./home;

  # pretty sure this is going to be true for all my nixos boxes
  # but need to set up a couple more first before pulling into ../../nixos
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.device = "/dev/disk/by-uuid/173C-EF92";
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = "1048576";
  };

  users.users.shimmerjs = {
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    gitAndTools.git-crypt
  ];
}
