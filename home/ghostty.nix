{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;

    settings = {
      background-opacity = 0.9;
      bold-is-bright = true;
      confirm-close-surface = false;
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 12;
      gtk-titlebar = false;
      mouse-hide-while-typing = true;
      shell-integration-features = "no-cursor";
      window-decoration = true;

      font-feature = [ 
        "-liga" 
        "-dlig" 
        "-calt" 
      ]; 
    };
  };
}
