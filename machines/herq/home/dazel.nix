{
  programs.zsh.sessionVariables = {
    DAZEL_IMAGE = "dazel";
    DAZEL_REPOSITORY = "shimmerjs";
    DAZEL_VOLUMES = "/home/shimmerjs/.kube/config:/root/.kube/config,/home/shimmerjs/.config/gcloud:/root/.config/gcloud,/home/shimmerjs/dev/dazel/config.json:/root/.docker/config.json,/var/run/docker.sock:/var/run/docker.sock";
  };
  programs.zsh.initExtra = ''
    # symlink dazel to ~/bin/bazel if it doesnt exist
    if [ ! -f ~/bin/bazel ]; then
      mkdir -p ~/bin
      ln -s "$(which dazel)" ~/bin/bazel
    fi
  '';
}
