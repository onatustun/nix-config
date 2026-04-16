{
  flake.modules.homeManager.zmkbatx =
    { lib, pkgs, ... }:
    let
      inherit (lib.meta) getExe';
    in
    {
      home.packages = [ pkgs.zmkbatx ];

      systemd.user.services.zmkbatx = {
        Unit = {
          Description = "zmkbatx";
          After = [ "noctalia-shell.service" ];
        };

        Service = {
          ExecStartPre = "${getExe' pkgs.coreutils "sleep"} 5";
          ExecStart = getExe' pkgs.zmkbatx "zmkBATx";
          Restart = "on-failure";
          RestartSec = 3;
        };

        Install.WantedBy = [ "noctalia-shell.service" ];
      };
    };
}
