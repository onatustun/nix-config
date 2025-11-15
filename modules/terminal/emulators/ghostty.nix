{
  flake.modules.homeManager.ghostty.programs.ghostty = {
    enable = true;
    installVimSyntax = true;

    settings = {
      confirm-close-surface = false;
      mouse-hide-while-typing = true;
      shell-integration-features = "no-cursor";
      bold-is-bright = true;
      gtk-titlebar = false;
      window-decoration = "auto";
      window-padding-x = 0;
      window-padding-y = 0;

      font-feature = [
        "-calt"
        "-liga"
        "-dlig"
      ];
    };
  };
}
