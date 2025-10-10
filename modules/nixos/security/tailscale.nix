{
  secretsDir,
  config,
  ...
}: {
  age.secrets."tailscale-authkey" = {
    file = "${secretsDir}/nixos/common/tailscale-authkey.age";
    owner = "root";
    group = "root";
    mode = "0400";
  };

  services.tailscale = {
    interfaceName = "tailscale0";
    authKeyFile = config.age.secrets."tailscale-authkey".path;
    useRoutingFeatures = "both";
    openFirewall = true;
    extraUpFlags = ["--ssh"];
    extraSetFlags = ["--advertise-exit-node"];
  };

  networking.firewall = with config.services.tailscale; {
    enable = true;
    trustedInterfaces = [interfaceName];
    allowedUDPPorts = [port];
  };
}
