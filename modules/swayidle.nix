{ moduleWithSystem, ... }:
{
  flake.homeModules.swayidle = moduleWithSystem (
    { inputs', ... }:
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      inherit (lib.lists) singleton;
      inherit (lib.meta)
        getExe'
        getExe
        ;
    in
    {
      home.packages = [ pkgs.sway-audio-idle-inhibit ];

      services.swayidle = {
        enable = true;

        timeouts = singleton {
          timeout = 300;
          command = "${getExe' inputs'.noctalia.packages.default "noctalia-shell"} ipc call lockScreen lock";
        };
      };

      systemd.user.services.sway-audio-idle-inhibit = {
        Unit = {
          After = [ config.wayland.systemd.target ];
          PartOf = [ config.wayland.systemd.target ];
        };

        Service = {
          ExecStart = getExe pkgs.sway-audio-idle-inhibit;
          Slice = "app.slice";
          Restart = "on-failure";
        };

        Install.WantedBy = [ config.wayland.systemd.target ];
      };
    }
  );
}
