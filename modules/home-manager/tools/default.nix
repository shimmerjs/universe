{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # tools that are pulled from nixpkgs

    # nix dev tools
    # helps manage pinned nixpkgs and other dependencies from github
    niv

    # misc
    caddy
    curl
    fzf
    bat
    htop
    jq
    coreutils
    ffmpeg
    ack
    tree
    pandoc
    graphviz # a picture is worth a thousand words
    d2 # a picture is worth a thousand words v2
    asciinema # a movie must be worth a trilly
    cue # https://cuelang.org
    crane

    # text editors
    vim

    # build tools
    just
    watchexec
    docker

    # languages
    yarn
    go_1_20
    gopls
    gopkgs
    godef
    golint
    gocode-gomod
    gotools
    golangci-lint
    # https://github.com/microsoft/vscode-remote-release/issues/648#issuecomment-503148523
    nodejs-18_x
    nixpkgs-fmt
    (python3.withPackages
      # install pip because its not included with the python3 nixpkg by
      # default
      (ps: with ps; [ pip pylint autopep8 ]))

    # koob
    kubectl
    kustomize
    kubectx

    # flash keyboard changes
    # see TODO in wally.nix
    # wally-cli

    gh # github cli
  ];
}
