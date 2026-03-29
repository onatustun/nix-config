{
  flake.nixosModules.printing =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      services = {
        avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
        };

        printing = {
          enable = true;

          drivers = attrValues {
            inherit (pkgs)
              cups-browsed
              cups-filters
              ;
          };
        };
      };
    };
}
