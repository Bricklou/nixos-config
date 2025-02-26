{
  mylib,
  catppuccin,
  pkgs,
  ...
}: let
  # Create a custom overlay for the catppuccin kvantum theme
  catppuccin-kvantum-patched = pkgs.stdenvNoCC.mkDerivation {
    name = "catppuccin-kvantum-patched";

    # Use the original catppuccin kvantum source
    src = catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.kvantum.src;

    # No build dependencies needed for simple text replacement
    nativeBuildInputs = [pkgs.gnused];

    buildPhase = ''
      # First create a copy of the source directory
      ls -l ${catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.kvantum.src}/themes/catppuccin-mocha-mauve
      mkdir -p "$out/share/Kvantum/catppuccin-mocha-mauve"
      cp -r ${catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.kvantum.src}/themes/catppuccin-mocha-mauve/* "$out/share/Kvantum/catppuccin-mocha-mauve/"

      # Set the file path variable
      configPath="$out/share/Kvantum/catppuccin-mocha-mauve/catppuccin-mocha-mauve.kvconfig"

      # Now modify the specific theme file you want to change
      sed -i 's/translucent_windows=false/translucent_windows=true/' "$configPath"
      sed -i 's/blurring=false/blurring=true/' "$configPath"
      sed -i 's/reduce_menu_opacity=0/reduce_menu_opacity=25/' "$configPath"
      sed -i 's/reduce_window_opacity=10/reduce_window_opacity=20/' "$configPath"
      sed -i 's/shadowless_popup=false/shadowless_popup=true/' "$configPath"
      sed -i 's/transient_groove=false/transient_groove=true\nmenu_blur_radius=10\ntooltip_blur_radius=10/' "$configPath"
      sed -i 's/transparent_dolphin_view=false/transparent_dolphin_view=true/' "$configPath"
    '';

    # No separate install phase needed
    installPhase = "true";
  };
in {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      catppuccin.homeManagerModules.catppuccin
    ];

  catppuccin = {
    enable = true;
    flavor = "mocha";

    sources.kvantum = catppuccin-kvantum-patched;

    starship.enable = true;
    lazygit.enable = true;
    fzf.enable = true;
    k9s.enable = true;
    kvantum.enable = true;
    kitty.enable = true;
    gtk.enable = true;
  };
}
