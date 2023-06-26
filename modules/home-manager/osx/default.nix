{ pkgs, ... }:
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

  home.packages = with pkgs; [
    # Try to stop OSX updates from breaking Bazel builds...
    darwin.CF
  ];
}
