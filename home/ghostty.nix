{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;

    settings = {
      confirm-close-surface = false;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      gtk-titlebar = false;
      mouse-hide-while-typing = true;
      shell-integration-features = "no-cursor";
      theme = "Builtin Solarized Dark";
      window-decoration = true;

      font-feature = [ 
        "-liga" 
        "-dlig" 
        "-calt" 
      ];
    };
  };
}
