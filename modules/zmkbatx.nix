{
  flake.homeModules.zmkbatx = {
    lib,
    pkgs,
    ...
  }: {
    systemd.user.services.zmkbatx = {
      Unit = {
        Description = "zmkbatx";
        After = ["noctalia-shell.service"];
      };

      Service = {
        ExecStartPre = "${lib.meta.getExe' pkgs.coreutils "sleep"} 5";
        ExecStart = lib.meta.getExe' pkgs.zmkbatx "zmkBATx";
        Restart = "on-failure";
        RestartSec = 3;
      };

      Install.WantedBy = ["noctalia-shell.service"];
    };

    home.packages = [pkgs.zmkbatx];
  };
}
