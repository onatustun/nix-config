{
  secretsDir,
  config,
  ...
}: let
  interfaceName = "tailscale0";
in {
  age.secrets."tailscale-authkey" = {
    file = "${secretsDir}/nixos/common/tailscale-authkey.age";
    owner = "root";
    group = "root";
    mode = "0400";
  };

  services.tailscale = {
    inherit interfaceName;
    authKeyFile = config.age.secrets."tailscale-authkey".path;
    useRoutingFeatures = "both";
    openFirewall = true;
    extraUpFlags = ["--ssh"];
    extraSetFlags = ["--advertise-exit-node"];
  };

  networking.firewall = {
    enable = true;
    trustedInterfaces = [interfaceName];
    allowedUDPPorts = [config.services.tailscale.port];
  };
}
