{
  inputs,
  pkgs,
  ...
}: {
  programs.ghostty = {
    package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
      window-decoration = "auto";
    };
  };
}
