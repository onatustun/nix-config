{
  config,
  lib,
  ...
}: let
  inherit (lib) getExe;
in {
  services.swayidle = {
    enable = false;

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
