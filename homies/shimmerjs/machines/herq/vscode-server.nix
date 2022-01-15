# herq is used as a remote vscode host for some machines
# https://nixos.wiki/wiki/Visual_Studio_Code#Remote_SSH
# https://github.com/msteen/nixos-vscode-server
# ---
# hack/tools/nixos/enable-nixos-vscode-systemd.sh must be 
# ran after this to complete the setup
{ ... }:
let
  sources = import <u/nix/sources.nix>;
in
{
  imports = [
    "${sources.nixos-vscode-server}/modules/vscode-server"
  ];

  services.vscode-server.enable = true;
}
