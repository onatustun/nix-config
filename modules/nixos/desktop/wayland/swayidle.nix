{
  lib,
  inputs',
  ...
}: let
  inherit (lib) getExe;
  package = inputs'.nixpkgs-wayland.packages.swayidle;
in {
  environment.systemPackages = [package];

  home-manager.sharedModules = [
    {
      services.swayidle = {
        enable = true;
        inherit package;

        events = [
          {
            event = "before-sleep";
            command = "${getExe package} -defF";
          }
          {
            event = "lock";
            command = "${getExe package} -defF";
          }
        ];

        timeouts = [
          {
            timeout = 200;
            command = "${getExe package} -defF";
          }
        ];
      };
    }
  ];
}
