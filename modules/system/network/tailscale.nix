{
  flake.modules.nixos = {
    network = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.tailscale;
    };

    tailscale = {
      self,
      lib,
      pkgs,
      config,
      ...
    }: {
      age.secrets."tailscale-authkey" = {
        file = "${self}/secrets/nixos/common/tailscale-authkey.age";
        owner = "root";
        group = "root";
        mode = "0400";
      };

      environment.systemPackages = lib.lists.singleton pkgs.tailscale;

      services = {
        resolved.settings.Resolve.Domains = lib.lists.singleton "~.";

        tailscale = {
          enable = true;
          authKeyFile = config.age.secrets."tailscale-authkey".path;
          useRoutingFeatures = "both";
          openFirewall = true;
          extraUpFlags = lib.lists.singleton "--ssh";
          extraSetFlags = lib.lists.singleton "--advertise-exit-node";
        };
      };

      networking.firewall = {
        trustedInterfaces = lib.lists.singleton config.services.tailscale.interfaceName;
        allowedUDPPorts = lib.lists.singleton config.services.tailscale.port;
      };
    };
  };
}
