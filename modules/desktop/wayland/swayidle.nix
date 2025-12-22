{
  flake.modules.homeManager.swayidle = {
    pkgs,
    lib,
    ...
  }: let
    package = pkgs.swayidle;
    command = "${lib.meta.getExe package} -defF";
  in {
    home.packages = [package];

    services.swayidle = {
      enable = true;

      events = {
        before-sleep = command;
        lock = command;
      };

      timeouts = [
        {
          timeout = 200;
          inherit command;
        }
      ];
    };
  };
}
