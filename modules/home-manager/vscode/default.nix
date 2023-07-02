{ pkgs, ... }:
{
  programs.vscode = with pkgs; {
    enable = true;
    extensions = with vscode-extensions; [
      ms-vscode-remote.remote-ssh
    ] ++ vscode-utils.extensionsFromVscodeMarketplace (import ./extensions.nix).extensions;
    userSettings = import ./user-settings.nix;
    keybindings = import ./keybindings.nix;
  };

  programs.zsh = {
    sessionVariables = {
      EDITOR = "code --wait";
    };
  };
}
