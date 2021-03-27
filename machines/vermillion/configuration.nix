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

  boot.extraModulePackages = [ config.boot.kernelPackages.r8125 ];
  nixpkgs.config.allowUnfree = true;

  home-manager.users.scott = import ./home;

  users.users.devin = {
    isNormalUser = true;
    home = "/home/devin";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfVvALh/Axv6jDu8jqw863qcpQkE0YCnD9ZZ+rprA1OUBCAJShNalJU21UCox3zFXzyJ0PzT/kB6B2OVZyAhRDlJxTVtM5ArJNflBYxdojKVp1fT8cMYH1iA2VdnXFchh7p//ptQ3N2vdhTsRE6+HD+kBWQVZFzUnCmpIhcXwtLA7pPKmb6wpVHA8UDbcRBq9b9154o2ZGBPDX3DUz/a1u/+szAxFUf8ZzflypJ3s3+snbSZs1hc3SN3fLwLLAN5KtjhSAlhZ79lE6n01f3iLBzsxpGx+eucWOvhZSOwAyySuFfBLccjRi0JmHMn3CMXhgayb2sOoRJ0Mg3OxsZ9vb65FoUdhVr+NVcNtDO18n5aRINTXZskVHyu191aW7VKfpHoaw4kI0NSQ0gFbVPB6keJjlII5SyQKqIcFPzYuD01/jJf0XKs5LbQ3/2B/Gw/JvnFV0Fn8wsMmhZHwKMGUSoe7vN4cO7vSIR56dJpOMAPyn4205WTr1tBpub7eHWS0= devinsink@Devins-MacBook-Pro.local" ];
  };

  # pretty sure this is going to be true for all my nixos boxes
  # but need to set up a couple more first before pulling into ../../nixos
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.device = "/dev/disk/by-uuid/18AA-4CFE";

  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = "1048576";
  };

  networking.hostName = "vermillion";
}
