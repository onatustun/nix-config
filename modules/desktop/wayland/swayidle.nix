{
  flake.modules.homeManager.swayidle = {
    pkgs,
    lib,
    ...
  }: let
    package = pkgs.swayidle;
  in {
    home.packages = [package];

    services.swayidle = {
      enable = true;

      events = [
        {
          event = "before-sleep";
          command = "${lib.meta.getExe package} -defF";
        }
        {
          event = "lock";
          command = "${lib.meta.getExe package} -defF";
        }
      ];

      timeouts = [
        {
          timeout = 200;
          command = "${lib.meta.getExe package} -defF";
        }
      ];
    };
  };
}
