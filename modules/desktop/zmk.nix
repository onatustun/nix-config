{
  flake.modules.homeManager.zmkbatx = {
    pkgs,
    lib,
    ...
  }: {
    home.packages = [pkgs.zmkbatx];

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
  };
}
