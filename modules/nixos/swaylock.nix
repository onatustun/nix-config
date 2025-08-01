{pkgs, ...}: {
  environment.systemPackages = [pkgs.swaylock];

  home-manager.sharedModules = [
    {
      programs.swaylock = {
        enable = true;

        settings = {
          font-size = 50;
          indicator-radius = 100;
          indicator-thickness = 10;
          line-uses-ring = true;
          indicator-idle-visible = true;
          daemonize = true;
          scaling = "fill";
        };
      };
    }
  ];
}
