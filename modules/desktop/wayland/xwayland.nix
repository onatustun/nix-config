{
  flake.modules.homeManager.xwayland = {
    inputs',
    pkgs,
    lib,
    ...
  }: let
    package = inputs'.xwayland-satellite.packages.default;
    session = "graphical-session.target";
  in {
    home.packages = [
      pkgs.xwayland
      package
    ];

    systemd.user.services.xwayland-satellite = {
      Unit = {
        Description = "Xwayland outside your Wayland";
        BindsTo = session;
        PartOf = session;
        After = session;
        Requisite = session;
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
