{
  flake.modules.nixos.bluetooth = {pkgs, ...}: {
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
}
