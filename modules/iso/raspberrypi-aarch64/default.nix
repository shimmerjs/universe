{ config
, sources ? import <u/nix/sources.nix>
, pkgs ? import <u/nix> { inherit sources; }
, ...
}:
{
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
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
    # require rpi specific networking config required to connect
    # on first boot
    <u/modules/rpi/networking.nix>
  ];

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  services.openssh.enable = true;

  networking.hostName = builtins.getEnv "HOSTNAME";
}

