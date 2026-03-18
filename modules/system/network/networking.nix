{
  flake.modules.nixos = {
    network = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.networking;
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
