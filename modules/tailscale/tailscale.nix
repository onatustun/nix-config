{
  flake.nixosModules.tailscale = {config, ...}: {
    age.secrets.authkey = {
      file = ./authkey.age;
      owner = "root";
      group = "root";
      mode = "0400";
    };

    services = {
      resolved.settings.Resolve.Domains = ["~."];

      tailscale = {
        enable = true;
        authKeyFile = config.age.secrets.authkey.path;
        useRoutingFeatures = "both";
        openFirewall = true;
        extraUpFlags = ["--ssh"];
        extraSetFlags = ["--advertise-exit-node"];
      };
    };

    networking.firewall.trustedInterfaces = [config.services.tailscale.interfaceName];
  };
}
