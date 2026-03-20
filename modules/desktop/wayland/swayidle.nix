{moduleWithSystem, ...}: {
  flake.homeModules = {
    wayland = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.swayidle;
    };

    swayidle = moduleWithSystem ({inputs', ...}: {
      pkgs,
      lib,
      config,
      ...
    }: {
      home.packages = [
        pkgs.sway-audio-idle-inhibit
        pkgs.swayidle
      ];

      services.swayidle = {
        enable = true;

        timeouts = lib.lists.singleton {
          timeout = 300;
          command = "${lib.meta.getExe' inputs'.noctalia.packages.default "noctalia-shell"} ipc call lockScreen lock";
        };
      };

      systemd.user.services.sway-audio-idle-inhibit = {
        Unit = {
          After = lib.lists.singleton config.wayland.systemd.target;
          PartOf = lib.lists.singleton config.wayland.systemd.target;
        };

        Service = {
          ExecStart = lib.meta.getExe pkgs.sway-audio-idle-inhibit;
          Slice = "app.slice";
          Restart = "on-failure";
        };

        Install.WantedBy = lib.lists.singleton config.wayland.systemd.target;
      };
    });
  };
}
