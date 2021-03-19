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
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD7aNBkcQK8pOMhsFpDmY8kkI+jxnwqgark6GImy6Ze4P2+yOyoT7uMbf+KLGOU5VX5etaRCN4ZyArWJz4UtTIuoL8tda00RKW0e8EDvlYI/d7eAs9EHih1uqZCPQZjwdEnB94VI4UG/9VDHTSUO4aI+b7Hnu4q0YaWt+hvB+GKK9v6iTRy6mErjeBBUn8a6XxZgFycdNZinPwBUfr2kB3pmTp2U55lm3zN66wOhGl4Ap9mY2rX0OyA3z8SThetnMLcNqmZ0jyS7vTptCf8ZejS06GTnIR9DiTTbASG8mexudbVj6erZXgyRXb9vqUAzOcGzzzigp8jel9Wws7L1X+B shimmerjs@overlook"
  ];
}
