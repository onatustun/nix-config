{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.swayidle];

  home-manager.sharedModules = [
    {
      services.swayidle = let
        inherit (lib) getExe;
      in {
        enable = true;

        events = [
          {
            event = "before-sleep";
            command = "${getExe pkgs.swaylock} -defF";
          }
          {
            event = "lock";
            command = "${getExe pkgs.swaylock} -defF";
          }
        ];

        timeouts = [
          {
            timeout = 200;
            command = "${getExe pkgs.swaylock} -defF";
          }
        ];
      };
    }
  ];
}
