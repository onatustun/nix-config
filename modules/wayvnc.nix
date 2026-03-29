{
  flake.homeModules.wayvnc =
    {
      lib,
      config,
      pkgs,
      isDesktop,
      hostName,
      ...
    }:
    let
      inherit (lib.meta) getExe;
      inherit (lib.attrsets) attrValues;
    in
    {
      systemd.user.services.wayvnc = {
        Unit = {
          After = [ config.wayland.systemd.target ];
          PartOf = [ config.wayland.systemd.target ];
        };

        Service = {
          ExecStart = "${getExe pkgs.wayvnc} -Linfo -o ${
            if isDesktop then "HDMI-A-1" else "eDP-1"
          } ${hostName}.tail32e3ea.ts.net 5901";

          Restart = "on-failure";
          RestartSec = "1m";
        };

        Install.WantedBy = [ config.wayland.systemd.target ];
      };

      home.packages = attrValues {
        inherit (pkgs)
          remmina
          wayvnc
          ;
      };
    };
}
