{
  programs.zsh = {
    sessionVariables = {
      UNIVERSE_HOME = "$HOME/dev/universe";
    };
    shellGlobalAliases = {
      uni = "just --justfile $UNIVERSE_HOME/justfile";
    };
  };
}
