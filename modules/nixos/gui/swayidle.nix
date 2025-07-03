{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
in {
  environment.systemPackages = [pkgs.swayidle];

  home-manager.sharedModules = [
    {
      services.swayidle = {
        enable = true;

        events = [
          {
            event = "before-sleep";
            command = "${getExe config.programs.swaylock.package} -defF";
          }
          {
            event = "lock";
            command = "${getExe config.programs.swaylock.package} -defF";
          }
        ];

        timeouts = [
          {
            timeout = 200;
            command = "${getExe config.programs.swaylock.package} -defF";
          }
        ];
      };
    }
  ];
}
