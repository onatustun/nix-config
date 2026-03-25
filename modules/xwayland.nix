{moduleWithSystem, ...}: {
  flake.homeModules.xwayland = moduleWithSystem ({inputs', ...}: {
    config,
    lib,
    pkgs,
    ...
  }: {
    systemd.user.services.xwayland-satellite = {
      Unit = {
        Description = "Xwayland outside your Wayland";
        BindsTo = config.wayland.systemd.target;
        PartOf = config.wayland.systemd.target;
        After = config.wayland.systemd.target;
        Requisite = config.wayland.systemd.target;
      };

      Service = {
        Type = "notify";
        NotifyAccess = "all";
        ExecStart = "${lib.meta.getExe inputs'.xwayland-satellite.packages.default}";
        StandardOutput = "journal";
      };
    };

    home.packages = [
      inputs'.xwayland-satellite.packages.default
      pkgs.xwayland
    ];
  });
}
