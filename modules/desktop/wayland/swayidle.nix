{
  flake.modules.homeManager.swayidle = {
    inputs',
    lib,
    ...
  }: let
    package = inputs'.nixpkgs-wayland.packages.swayidle;
  in {
    home.packages = [package];

    services.swayidle = {
      enable = true;
      inherit package;

      events = [
        {
          event = "before-sleep";
          command = "${lib.getExe package} -defF";
        }
        {
          event = "lock";
          command = "${lib.getExe package} -defF";
        }
      ];

      timeouts = [
        {
          timeout = 200;
          command = "${lib.getExe package} -defF";
        }
      ];
    };
  };
}
