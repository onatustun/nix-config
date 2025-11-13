{
  flake.modules = {
    nixos = {
      thunar = {self, ...}: {
        imports = [self.modules.nixos.thunar'];
        home-manager.sharedModules = [self.modules.homeManager.thunar];
      };

      thunar' = {pkgs, ...}: {
        services.tumbler.enable = true;

        programs.thunar = {
          enable = true;

          plugins = [
            pkgs.xfce.thunar-archive-plugin
            pkgs.xfce.thunar-media-tags-plugin
            pkgs.xfce.thunar-volman
          ];
        };

        environment.systemPackages = [
          pkgs.kdePackages.ark
          pkgs.ffmpegthumbnailer
          pkgs.libgsf
          pkgs.xfce.tumbler
        ];
      };
    };

    homeManager.thunar.xdg.mimeApps.defaultApplications."inode/directory" = "thunar.desktop";
  };
}
