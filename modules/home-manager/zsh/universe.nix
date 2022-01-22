{
  programs.zsh = {
    sessionVariables = {
      UNIVERSE_HOME = "$HOME/dev/universe";
    };
    shellGlobalAliases = {
      u = "just --justfile $UNIVERSE_HOME/justfile";
    };
  };
}
