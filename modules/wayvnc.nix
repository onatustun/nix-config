{
  flake.homeModules.wayvnc = {
    lib,
    config,
    pkgs,
    hostName,
    isDesktop,
    ...
  }: {
    systemd.user.services.wayvnc = {
      Unit = {
        After = lib.lists.singleton config.wayland.systemd.target;
        PartOf = lib.lists.singleton config.wayland.systemd.target;
      };

      Service = {
        ExecStart = "${lib.meta.getExe pkgs.wayvnc} -Linfo -o ${
          if isDesktop
          then "HDMI-A-1"
          else "eDP-1"
        } ${hostName}.tail32e3ea.ts.net 5901";

        Restart = "on-failure";
        RestartSec = "1m";
      };

      Install.WantedBy = lib.lists.singleton config.wayland.systemd.target;
    };

    home.packages = [
      pkgs.remmina
      pkgs.wayvnc
    ];
  };
}
