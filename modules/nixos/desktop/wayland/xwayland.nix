{
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) getExe;
in {
  environment.systemPackages = [
    pkgs.xwayland
    inputs.xwayland-satellite.packages.${pkgs.stdenv.hostPlatform.system}.xwayland-satellite
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
          ExecStart = "${getExe inputs.xwayland-satellite.packages.${pkgs.stdenv.hostPlatform.system}.xwayland-satellite}";
          StandardOutput = "journal";
        };
      };
    }
  ];
}
