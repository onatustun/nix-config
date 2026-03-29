{
  flake.homeModules.tui =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.scooter ];

      programs = {
        bottom.enable = true;
        btop.enable = true;
      };
    };
}
