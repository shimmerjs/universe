{
  programs.zsh.sessionVariables = {
    DAZEL_IMAGE = "dazel";
    DAZEL_REPOSITORY = "scottshuffler";
    DAZEL_VOLUMES = "/home/scott/.kube/config:/root/.kube/config,/home/scott/.config/gcloud:/root/.config/gcloud,/home/scott/dev/dazel/config.json:/root/.docker/config.json,/var/run/docker.sock:/var/run/docker.sock";
  };
  programs.zsh.initExtra = ''
    # symlink dazel to ~/bin/bazel if it doesnt exist
    if [ ! -f ~/bin/bazel ]; then
      mkdir -p ~/bin
      ln -s "$(which dazel)" ~/bin/bazel
    fi
  '';
}
