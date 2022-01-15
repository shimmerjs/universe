{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    /bootstrap/system
  ];

  # taken from https://nixos.wiki/wiki/NixOS_on_ARM#Installation
  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.interfaces.eth0.useDHCP = true;

  nixpkgs.system = "aarch64-linux";

  networking.hostName = builtins.getEnv "HOSTNAME";

  environment.systemPackages = with pkgs; [
    tailscale
  ];
}
