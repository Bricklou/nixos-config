{pkgs, ...}: {
  # all fonts are linked to /nix/var/profiles/system/sw/share/X11/fonts
  fonts = {
    #use fonts specified by user rather than default ones
    enableDefaultPackages = false;
    fontDir.enable = true;

    packages = with pkgs; [
      # icons-fonts
      material-design-icons

      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra

      source-sans
      source-serif

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/data/fonts/nerdfonts/shas.nix
      # symbol icon only
      nerd-fonts.symbols-only
      # characters
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono

      # other fonts
      dejavu_fonts
    ];

    #use defined fonts
    # the reason there's Noto Color Emoji everywhere is to override Dejavu's
    # B&W emojis that would sometimes show instead of smome Color emojis
    fontconfig.defaultFonts = {
      serif = ["Source Serif SC" "Source Serif TC" "Noto Color Emoji"];
      sansSerif = ["Source Sans SC" "Source Sans TC" "Noto Color Emoji"];
      monospace = ["FiraCode Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
