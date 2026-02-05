{
  flake.modules.homeManager.zmkBATx = {
    pkgs,
    lib,
    ...
  }: {
    home.packages = [pkgs.zmkBATx];

    systemd.user.services.zmkBATx = {
      Install.WantedBy = ["noctalia-shell.service"];
      Unit.Description = "zmkBATx";

      Service = {
        ExecStart = ''
          ${pkgs.runtimeShell} -l -c "${lib.meta.getExe' pkgs.busybox "sleep"} 5 && ${lib.meta.getExe pkgs.zmkBATx}"
        '';
        Restart = "on-failure";
        RestartSec = 3;
      };
    };
  };
}
