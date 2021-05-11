{ pkgs, ... }:
let
  # go binaries
  github-cli = import ./github-cli.nix { };
  wally-cli = import ./wally.nix { };
  kpt = import ./kpt.nix { };
  crane = import ./crane.nix { };
  # python tools
  dazel = import ./dazel.nix { };
in
{
  home.packages = with pkgs; [
    # tools that are pulled from nixpkgs

    # misc
    curl
    fzf
    htop
    jq
    coreutils
    ffmpeg
    ack
    tree
    pandoc
    graphviz # a picture is worth a thousand words

    # build tools
    just
    bazelisk
    bazel-buildtools
    watchexec

    # languages
    yarn
    niv
    go
    gopls
    gopkgs
    godef
    golint
    gocode-gomod
    goimports
    golangci-lint
    # use node 12 because we need to hotswap the node binary vscode
    # server brings ^ _ ^
    # https://github.com/microsoft/vscode-remote-release/issues/648#issuecomment-503148523
    nodejs-12_x
    nixpkgs-fmt
    (python3.withPackages
      # install pip because its not included with the python3 nixpkg by
      # default
      (ps: with ps; [ pip pylint autopep8 dazel ]))

    # koob
    kubectl
    kubectx
    kpt

    # clout
    google-cloud-sdk

    # tools i maintain the package defs for
    github-cli
    wally-cli # for flashing firmware to my ergoxo
    crane
  ];
}
