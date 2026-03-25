{
  flake.nixosModules.networking = {
    hostName,
    lib,
    pkgs,
    ...
  }: {
    services.resolved.enable = true;

    networking = {
      inherit hostName;

      networkmanager = {
        enable = true;
        wifi.powersave = false;
        dns = "systemd-resolved";
      };

      firewall.checkReversePath = "loose";
    };

    environment.systemPackages = lib.lists.singleton pkgs.networkmanagerapplet;
  };
}
