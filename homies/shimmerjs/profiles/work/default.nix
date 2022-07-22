{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # clout
    google-cloud-sdk
  ];

  programs.zsh = {
    sessionVariables = {
      GOPRIVATE = "github.com/ncr-swt-retail,edge-infra.dev";
      HOMIE = "shimmerjs";
    };
  };

  programs.git = {
    userName = "alex weidner";
    extraConfig = {
      include = {
        path = "~/.config/git/ncr";
      };
    };
  };

  home.file.".config/git/ncr".text = builtins.readFile ./gitconfig;
}
