{
  lib,
  inputs',
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  package = inputs'.xwayland-satellite.packages.default;
in {
  environment.systemPackages = [
    pkgs.xwayland
    package
  ];

  home-manager.sharedModules = [
    {
      systemd.user.services.xwayland-satellite = {
        Unit = {
          Description = "Xwayland outside your Wayland";
          BindsTo = "graphical-session.target";
          PartOf = "graphical-session.target";
          After = "graphical-session.target";
          Requisite = "graphical-session.target";
        };

        Service = {
          Type = "notify";
          NotifyAccess = "all";
          ExecStart = "${getExe package}";
          StandardOutput = "journal";
        };
      };
    }
  ];
}
