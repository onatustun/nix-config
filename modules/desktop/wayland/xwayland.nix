{
  flake.modules.homeManager.xwayland = {
    inputs',
    pkgs,
    lib,
    ...
  }: let
    package = inputs'.xwayland-satellite.packages.default;
  in {
    home.packages = [
      pkgs.xwayland
      package
    ];

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
        ExecStart = "${lib.meta.getExe package}";
        StandardOutput = "journal";
      };
    };
  };
}
