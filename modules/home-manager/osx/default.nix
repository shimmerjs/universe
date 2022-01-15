{ ... }:
let
  sources = import <u/nix/sources.nix>;
in
{
  imports = [
    "${sources.home-manager-darwin-apps}/modules/targets/darwin.nix"
    <u/modules/home-manager/vscode>
  ];

  darwin.installApps = true;
  darwin.fullCopies = true;

  programs.git = {
    extraConfig = {
      credential = {
        helper = "osxkeychain";
      };
    };
  };


}
