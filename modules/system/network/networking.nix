{
  flake.nixosModules = {
    network = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.networking;
    };

    networking = {
      lib,
      pkgs,
      hostName,
      ...
    }: {
      services.resolved.enable = true;
      environment.systemPackages = lib.lists.singleton pkgs.networkmanagerapplet;

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
  };
}
