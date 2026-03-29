{
  flake.nixosModules.printing =
    { pkgs, ... }:
    {
      services = {
        avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
        };

        printing = {
          enable = true;

          drivers = [
            pkgs.cups-filters
            pkgs.cups-browsed
          ];
        };
      };
    };
}
