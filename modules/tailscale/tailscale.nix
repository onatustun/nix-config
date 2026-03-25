{
  flake.nixosModules.tailscale = {
    lib,
    pkgs,
    config,
    ...
  }: {
    age.secrets.authkey = {
      file = ./authkey.age;
      owner = "root";
      group = "root";
      mode = "0400";
    };

    services = {
      resolved.settings.Resolve.Domains = lib.lists.singleton "~.";

      tailscale = {
        enable = true;
        authKeyFile = config.age.secrets.authkey.path;
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

    environment.systemPackages = lib.lists.singleton pkgs.tailscale;
  };
}
