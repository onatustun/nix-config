{
  flake.modules.homeManager.swaylock = {inputs', ...}: {
    programs.swaylock = {
      enable = true;
      package = inputs'.nixpkgs-wayland.packages.swaylock;

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
  };
}
