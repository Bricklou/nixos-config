{pkgs, ...}: {
  home.packages = with pkgs; [
    docker-compose
    lazydocker

    kubectl
    istioctl
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
