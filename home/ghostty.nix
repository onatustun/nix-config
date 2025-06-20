{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;

    settings = {
      bold-is-bright = true;
      confirm-close-surface = false;
      gtk-titlebar = false;
      mouse-hide-while-typing = true;
      shell-integration-features = "no-cursor";
      window-decoration = true;
    };
  };
}
