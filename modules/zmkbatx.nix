{
  flake.homeModules.zmkbatx = {
    lib,
    pkgs,
    ...
  }: {
    systemd.user.services.zmkbatx = {
      Install.WantedBy = ["noctalia-shell.service"];
      Unit.Description = "zmkbatx";

      Service = {
        ExecStart = ''
          ${pkgs.runtimeShell} -l -c "${lib.meta.getExe' pkgs.busybox "sleep"} 5 && ${lib.meta.getExe' pkgs.zmkbatx "zmkBATx"}"
        '';
        Restart = "on-failure";
        RestartSec = 3;
      };
    };

    home.packages = [pkgs.zmkbatx];
  };
}
