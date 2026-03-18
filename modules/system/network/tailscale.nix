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

      environment.systemPackages = [pkgs.tailscale];

      services = {
        resolved.settings.Resolve.Domains = ["~."];

        tailscale = {
          enable = true;
          authKeyFile = config.age.secrets."tailscale-authkey".path;
          useRoutingFeatures = "both";
          openFirewall = true;
          extraUpFlags = ["--ssh"];
          extraSetFlags = ["--advertise-exit-node"];
        };
      };

      networking.firewall = {
        trustedInterfaces = [config.services.tailscale.interfaceName];
        allowedUDPPorts = [config.services.tailscale.port];
      };
    };
  };
}
