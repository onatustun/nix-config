{
  flake.modules = {
    nixos = {
      thunar = {self, ...}: {
        imports = [self.modules.nixos.thunar'];
        home-manager.sharedModules = [self.modules.homeManager.thunar];
      };

      thunar' = {pkgs, ...}: {
        services = {
          gvfs.enable = true;
          tumbler.enable = true;
          udisks2.enable = true;
        };

        programs.thunar = {
          enable = true;

          plugins = [
            pkgs.xfce.thunar-archive-plugin
            pkgs.xfce.thunar-media-tags-plugin
            pkgs.xfce.thunar-volman
          ];
        };
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
        pkgs.udisks
        pkgs.xfce.tumbler
      ];
    };
  };
}
