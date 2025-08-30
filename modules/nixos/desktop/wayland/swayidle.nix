{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled getExe;
  package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.swayidle;
in {
  environment.systemPackages = [package];

  home-manager.sharedModules = [
    {
      services.swayidle = enabled {
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
