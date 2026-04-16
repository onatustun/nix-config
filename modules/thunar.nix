{
  flake.modules = {
    nixos.thunar =
      { pkgs, inputs, ... }:
      {
        services = {
          gvfs.enable = true;
          tumbler.enable = true;
        };

        programs.thunar = {
          enable = true;

          plugins = [
            pkgs.thunar-archive-plugin
            pkgs.thunar-media-tags-plugin
            pkgs.thunar-volman
          ];
        };

        home-manager.sharedModules = [ inputs.self.modules.homeManager.thunar ];
      };

    homeManager.thunar =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.ffmpegthumbnailer
          pkgs.kdePackages.ark
          pkgs.libgsf
        ];

        services.udiskie.enable = true;
        xdg.mimeApps.defaultApplications."inode/directory" = "thunar.desktop";
      };
  };
}
