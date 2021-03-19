{
  # import default git config
  imports = [ ../. ];

  # additional git config
  programs.git = {
    # credential = {
    #  username = "aw185176";
    # };
    extraConfig = {
      # use work identity for work
      includeIf."gitdir:~/dev/ncr/" = {
        # content defined below
        path = "~/.config/git/ncr";
      };
    };
  };

  # NCR
  home.file.".config/git/ncr".text = builtins.readFile ./gitconfig;
}
