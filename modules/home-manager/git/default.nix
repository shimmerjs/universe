{ pkgs, ... }:
{
  programs.git = with pkgs; {
    package = git;
    enable = true;

    extraConfig = {
      pull = {
        rebase = "false";
      };

      core = {
        editor = "vim";
      };
    };
  };

  home.packages = with pkgs; [
    gitAndTools.git-crypt
  ];
}
