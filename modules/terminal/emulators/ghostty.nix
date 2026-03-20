{moduleWithSystem, ...}: {
  flake = {
    nixosModules = {
      terminal = {
        lib,
        self,
        ...
      }: {
        imports = lib.lists.singleton self.nixosModules.ghostty;
      };

      ghostty = {
        lib,
        self,
        ...
      }: {
        nix.settings = {
          extra-substituters = lib.lists.singleton "https://ghostty.cachix.org";
          extra-trusted-public-keys = lib.lists.singleton "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns=";
        };

        home-manager.sharedModules = lib.lists.singleton self.homeModules.ghostty;
      };
    };

    homeModules.ghostty = moduleWithSystem ({inputs', ...}: {
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
    });
  };
}
