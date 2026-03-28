{
  flake.nixosModules.networking = {
    hostName,
    pkgs,
    ...
  }: {
    services.resolved.enable = true;

    networking = {
      inherit hostName;

      networkmanager = {
        enable = true;
        wifi.powersave = false;
      };

      firewall.checkReversePath = "loose";
    };

    environment.systemPackages = [pkgs.networkmanagerapplet];
  };
}
