{
  flake.nixosModules = {
    network = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.tailscale;
    };

    tailscale = {
      inputs,
      lib,
      pkgs,
      config,
      ...
    }: {
      age.secrets."tailscale-authkey" = {
        file = "${inputs.self}/secrets/nixos/common/tailscale-authkey.age";
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
