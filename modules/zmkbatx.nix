{
  flake.modules.homeManager.zmkbatx =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    let
      inherit (lib.meta) getExe' getExe;
    in
    {
      home.packages = [ pkgs.zmkbatx ];

      systemd.user.services.zmkbatx = {
        Unit = {
          After = [ config.wayland.systemd.target ];
          PartOf = [ config.wayland.systemd.target ];
        };

        Service = {
          ExecStartPre = "${getExe' pkgs.coreutils "sleep"} 5";
          ExecStart = getExe pkgs.zmkbatx;
          Restart = "on-failure";
          RestartSec = 3;
        };

        Install.WantedBy = [ config.wayland.systemd.target ];
      };
    };
}
