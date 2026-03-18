{
  flake.modules = {
    nixos = {
      gui = {
        lib,
        self,
        type,
        ...
      }: {
        imports = lib.lists.singleton self.modules.${type}.thunar;
      };

      thunar = {
        pkgs,
        lib,
        self,
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

        home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.thunar;
      };
    };

    homeManager.thunar = {pkgs, ...}: {
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
