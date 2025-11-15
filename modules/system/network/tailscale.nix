{
  flake.modules.nixos.tailscale = {
    secretsDir,
    pkgs,
    config,
    ...
  }: {
    age.secrets."tailscale-authkey" = {
      file = "${secretsDir}/nixos/common/tailscale-authkey.age";
      owner = "root";
      group = "root";
      mode = "0400";
    };

    environment.systemPackages = [pkgs.tailscale];

    services.tailscale = {
      enable = true;
      authKeyFile = config.age.secrets."tailscale-authkey".path;
      useRoutingFeatures = "both";
      openFirewall = true;
      extraUpFlags = ["--ssh"];
      extraSetFlags = ["--advertise-exit-node"];
    };

    networking.firewall = {
      trustedInterfaces = [config.services.tailscale.interfaceName];
      allowedUDPPorts = [config.services.tailscale.port];
    };
  };
}
