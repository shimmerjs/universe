{ config, sources ? import ../nix/sources.nix, pkgs ? import ../nix { inherit sources; }, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>

    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEHuRob4aBH21QRY9HgbuwzH3z6QwkF87fJNEI1oHz1l scottshuffler@gmail.com"
  ];

  boot.extraModulePackages = [ config.boot.kernelPackages.r8125 ];
   nixpkgs.config.allowUnfree = true;
}


