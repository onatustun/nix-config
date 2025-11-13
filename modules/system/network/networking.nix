{
  flake.modules.nixos.networking = {
    pkgs,
    hostName,
    ...
  }: {
    services.resolved.enable = true;
    environment.systemPackages = [pkgs.networkmanagerapplet];

    networking = {
      inherit hostName;

      networkmanager = {
        enable = true;
        wifi.powersave = false;
        dns = "systemd-resolved";
      };

      firewall.checkReversePath = "loose";
    };
  };
}
