{ config, lib, pkgs, ... }:
let
  # TODO: pull this from common location
  tokenDir = (import <u/modules/k3s/constants.nix>).agent.tokenDir;
in
{
  imports = [
    <u/modules/nixos>

    ./hardware-configuration.nix
    ./networking.nix
  ];

  # taken from https://nixos.wiki/wiki/NixOS_on_ARM#Installation
  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.system = "aarch64-linux";

  # set up permissions for shimmerjs to manage the box
  system.activationScripts = {
    # setting up permissions for easily copying k3s token
    k3s.text = ''
      mkdir -p ${tokenDir}
      chown -R shimmerjs ${tokenDir}
    '';
  };
}
