{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    docker-compose

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
