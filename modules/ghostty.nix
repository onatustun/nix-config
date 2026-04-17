{ moduleWithSystem, ... }:
{
  flake =
    { config, ... }:
    {
      modules = {
        nixos.ghostty = {
          nix.settings = {
            extra-substituters = [ "https://ghostty.cachix.org" ];
            extra-trusted-public-keys = [ "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns=" ];
          };

          home-manager.sharedModules = [ config.modules.homeManager.ghostty ];
        };

        homeManager.ghostty = moduleWithSystem (
          { inputs', ... }:
          {
            programs.ghostty = {
              enable = true;
              package = inputs'.ghostty.packages.default;
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
        );
      };
    };
}
