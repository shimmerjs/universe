{ pkgs, ... }:
let
  # go binaries
  github-cli = import ./github-cli.nix { };
  wally-cli = import ./wally.nix { };
  crane = import ./crane.nix { };
in
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

    # text editors
    vim

    # build tools
    just
    watchexec
    gccStdenv
    gcc
    gnumake
    docker

    # languages
    yarn
    go_1_17
    gopls
    gopkgs
    godef
    golint
    gocode-gomod
    gotools
    golangci-lint
    # https://github.com/microsoft/vscode-remote-release/issues/648#issuecomment-503148523
    nodejs-14_x
    nixpkgs-fmt
    (python3.withPackages
      # install pip because its not included with the python3 nixpkg by
      # default
      (ps: with ps; [ pip pylint autopep8 ]))

    # koob
    kubectl
    kustomize
    kubectx

    # clout
    google-cloud-sdk

    # tools i maintain the package defs for
    github-cli
    wally-cli # for flashing firmware to my ergoxo
    crane
  ];
}
