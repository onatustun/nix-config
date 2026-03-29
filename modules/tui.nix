{
  flake.homeModules.tui =
    { pkgs, ... }:
    {
      programs = {
        bottom.enable = true;
        btop.enable = true;
      };

      home.packages = [ pkgs.scooter ];
    };
}
