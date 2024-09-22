{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = ["--enable-features=TouchpadOverscrollHistoryNavigation"];
      extensions = [];
    };

    firefox = {
      enable = true;
      profiles.${username} = {};
    };
  };
}
