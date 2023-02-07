{ config, sources ? import ../nix/sources.nix, pkgs ? import ../nix { inherit sources; }, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>

    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>

    # passwordless root on image
    <u/modules/nixos/security/sudo.nix>
    # root ssh key setup for installation
    <u/modules/nixos/ssh/root.nix>
    # include tailscale config so that we can register the 
    # node with our mesh during bootstrapping
    <u/modules/nixos/networking>
    <u/modules/nixos/networking/eno1.nix>
  ];

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];

  networking.hostName = builtins.getEnv "HOSTNAME";
}
