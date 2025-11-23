{
  flake.modules = {
    nixos = {
      ghostty = {
        self,
        type,
        ...
      }: {
        imports = [self.modules.${type}.ghostty'];
        home-manager.sharedModules = [self.modules.homeManager.ghostty];
      };

      ghostty'.nix.settings = {
        extra-substituters = ["https://ghostty.cachix.org"];
        extra-trusted-public-keys = ["ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="];
      };
    };

    homeManager.ghostty = {inputs', ...}: {
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
    };
  };
}
