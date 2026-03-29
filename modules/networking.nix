{
  flake.nixosModules.networking =
    { hostName, pkgs, ... }:
    {
      networking = {
        inherit hostName;

        networkmanager = {
          enable = true;
          wifi.powersave = false;
        };

        firewall.checkReversePath = "loose";
      };

      environment.systemPackages = [ pkgs.networkmanagerapplet ];
      services.resolved.enable = true;
    };
}
