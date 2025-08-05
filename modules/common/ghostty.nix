{
  inputs,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default];

  home-manager.sharedModules = [
    {
      programs.ghostty = let
        inherit (lib) enabled;
      in
        enabled {
          package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
