{ ... }:
let
  sources = import <u/nix/sources.nix>;
in
{
  imports = [
    <u/modules/home-manager/vscode>
  ];

  programs.git = {
    extraConfig = {
      credential = {
        helper = "osxkeychain";
      };
    };
  };
}
