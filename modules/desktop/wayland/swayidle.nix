{
  flake.modules.homeManager.swayidle = {
    pkgs,
    lib,
    inputs',
    config,
    ...
  }: {
    home.packages = [
      pkgs.sway-audio-idle-inhibit
      pkgs.swayidle
    ];

    services.swayidle = {
      enable = true;

      timeouts = [
        {
          timeout = 300;
          command = "${lib.meta.getExe' inputs'.noctalia.packages.default "noctalia-shell"} ipc call lockScreen lock";
        }
      ];
    };

    systemd.user.services.sway-audio-idle-inhibit = {
      Unit = {
        After = [config.wayland.systemd.target];
        PartOf = [config.wayland.systemd.target];
      };

      Service = {
        ExecStart = lib.meta.getExe pkgs.sway-audio-idle-inhibit;
        Slice = "app.slice";
        Restart = "on-failure";
      };

      Install.WantedBy = [config.wayland.systemd.target];
    };
  };
}
