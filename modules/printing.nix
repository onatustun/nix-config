{
  flake.modules.nixos.printing =
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
            pkgs.cups-browsed
            pkgs.cups-filters
          ];
        };
      };
    };
}
