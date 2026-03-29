{
  flake = {
    nixosModules.thunar =
      {
        lib,
        pkgs,
        inputs,
        ...
      }:
      let
        inherit (lib.attrsets) attrValues;
      in
      {
        services = {
          gvfs.enable = true;
          tumbler.enable = true;
        };

        programs.thunar = {
          enable = true;

          plugins = attrValues {
            inherit (pkgs)
              thunar-archive-plugin
              thunar-media-tags-plugin
              thunar-volman
              ;
          };
        };

        home-manager.sharedModules = [ inputs.self.homeModules.thunar ];
      };

    homeModules.thunar =
      { lib, pkgs, ... }:
      let
        inherit (lib.attrsets) attrValues;
      in
      {
        home.packages = attrValues {
          inherit (pkgs)
            ffmpegthumbnailer
            libgsf
            ;
          inherit (pkgs.kdePackages) ark;
        };

        services.udiskie.enable = true;
        xdg.mimeApps.defaultApplications."inode/directory" = "thunar.desktop";
      };
  };
}
