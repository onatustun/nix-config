{
  flake.modules.nixos = {
    hardware = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.bluetooth;
    };

    bluetooth = {pkgs, ...}: {
      services = {
        blueman.enable = true;

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

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      environment.systemPackages = [
        pkgs.blueberry
        pkgs.blueman
      ];
    };
  };
}
