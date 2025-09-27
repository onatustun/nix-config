{
  inputs,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.swaylock = {
        enable = true;
        package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.swaylock;

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
