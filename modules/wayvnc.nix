{
  flake.modules.homeManager.wayvnc =
    {
      lib,
      pkgs,
      config,
      hostName,
      ...
    }:
    let
      inherit (lib.meta) getExe;

      monitor = {
        desktop = "HDMI-A-1";
        laptop = "eDP-1";
      };
    in
    {
      home.packages = [
        pkgs.remmina
        pkgs.wayvnc
      ];

      systemd.user.services.wayvnc = {
        Unit = {
          After = [ config.wayland.systemd.target ];
          PartOf = [ config.wayland.systemd.target ];
        };

        Service = {
          ExecStart = "${getExe pkgs.wayvnc} -Linfo -o ${monitor.${hostName}} ${hostName}.tail32e3ea.ts.net 5901";
          Restart = "on-failure";
          RestartSec = "1m";
        };

        Install.WantedBy = [ config.wayland.systemd.target ];
      };
    };
}
