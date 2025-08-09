{
  lib,
  isDarwin,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.ghostty = enabled {
        package =
          if isDarwin
          then null
          else inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;

        enableFishIntegration = true;
        installBatSyntax = !isDarwin;
        installVimSyntax = !isDarwin;

        settings = {
          bold-is-bright = true;
          confirm-close-surface = false;
          gtk-titlebar = false;
          mouse-hide-while-typing = true;
          shell-integration-features = "no-cursor";
          window-decoration = "auto";

          font-feature = [
            "-calt"
            "-liga"
            "-dlig"
          ];
        };
      };
    }
  ];
}
