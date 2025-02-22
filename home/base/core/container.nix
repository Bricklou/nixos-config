{pkgs, ...}: {
  home.packages = with pkgs; [
    docker-compose
    lazydocker

    kubectl
    kubecolor
    kubevirt # virtctl
    kubernetes-helm
  ];

  programs = {
    k9s = {
      enable = true;
      # https://k9scli.io/topics/aliases
      settings = {};
    };
  };
}
