{
  flake.nixosModules.bluetooth = {pkgs, ...}: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

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

    environment.systemPackages = [pkgs.blueman];
  };
}
