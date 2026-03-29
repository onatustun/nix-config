{ moduleWithSystem, ... }:
{
  flake.homeModules.xwayland = moduleWithSystem (
    { inputs', ... }:
    {
      lib,
      pkgs,
      config,
      ...
    }:
    let
      inherit (lib.meta) getExe;
    in
    {
      home.packages = [
        inputs'.xwayland-satellite.packages.default
        pkgs.xwayland
      ];

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
          ExecStart = "${getExe inputs'.xwayland-satellite.packages.default}";
          StandardOutput = "journal";
        };
      };
    }
  );
}
