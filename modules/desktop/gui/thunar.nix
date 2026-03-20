{
  flake = {
    nixosModules = {
      gui = {
        lib,
        inputs,
        ...
      }: {
        imports = lib.lists.singleton inputs.self.nixosModules.thunar;
      };

      thunar = {
        pkgs,
        lib,
        inputs,
        ...
      }: {
        services = {
          gvfs.enable = true;
          tumbler.enable = true;
          udisks2.enable = true;
        };

        programs.thunar = {
          enable = true;

          plugins = [
            pkgs.thunar-archive-plugin
            pkgs.thunar-media-tags-plugin
            pkgs.thunar-volman
          ];
        };

        home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.thunar;
      };
    };

    homeModules.thunar = {pkgs, ...}: {
      services.udiskie.enable = true;
      xdg.mimeApps.defaultApplications."inode/directory" = "thunar.desktop";

      home.packages = [
        pkgs.ffmpegthumbnailer
        pkgs.gvfs
        pkgs.kdePackages.ark
        pkgs.libgsf
        pkgs.tumbler
        pkgs.udisks
      ];
    };
  };
}
