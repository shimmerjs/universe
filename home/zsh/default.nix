{ pkgs, ... }:
let
  sources = import ../../nix/sources.nix;
in
{
  programs.zsh = with pkgs; {
    enable = true;
    enableAutosuggestions = true;
    initExtraBeforeCompInit = builtins.readFile ./zshrc;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "kubectl" ];
      theme = "sunrise";
    };
    shellGlobalAliases = {
      # TODO: try to put these aliases in the relevant modules
      k = "kubectl";
      ksh = "kitty +kitten ssh";
      me = "just --justfile ~/dev/shimmerjs/universe/justfile";
    };
    shellAliases = {
      ls = "ls -A";
    };
    history = {
      save = 1000000000;
      size = 1000000000;
    };
    sessionVariables = {
      HYPHEN_INSENSITIVE = "true";
      DISABLE_AUTO_UPDATE = "true";
      COMPLETION_WAITING_DOTS = "false";
      EDITOR = "code --wait";
      # try to fix ansi colors
      # https://superuser.com/a/448892
      CLICOLOR = 1;
      GIT_SSL_CAINFO = "${cacert}/etc/ssl/certs/ca-bundle.crt";
    };
    plugins = with sources; [
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          inherit (sources.zsh-syntax-highlighting) owner repo rev sha256;
        };
      }
      {
        name = "powerlevel10k";
        file = "powerlevel10k.zsh-theme";
        src = fetchFromGitHub {
          inherit (sources.powerlevel10k) owner repo rev sha256;
        };
      }
    ];
  };

  # add generated p10k config file to correct location for zshrc to find it and
  # source it
  home.file.".config/p10k.zsh".source = ./p10k.zsh;
}
