{
  programs = {
    tmux = {
      enable = true;
      terminal = "screen-256color";
      clock24 = true;
      extraConfig = ''
        set -ga terminal-overrides ",*256col*:Tc"
        set-environment -g COLORTERM "truecolor"

        # Mouse works as expected
               set -g mouse on
      '';
      catppuccin.enable = true;
    };
  };
}
