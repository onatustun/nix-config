{
  lib,
  inputs,
  pkgs,
  config,
  secretsDir,
  ...
}: let
  inherit (lib) enabled;
  interfaceName = "tailscale0";
  package = inputs.tailscale.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  age.secrets."tailscale-authkey" = {
    file = "${secretsDir}/tailscale-authkey.age";
    owner = "root";
    group = "root";
    mode = "0400";
  };

  services.tailscale = enabled {
    inherit interfaceName package;
    useRoutingFeatures = "both";
    openFirewall = true;
    extraUpFlags = ["--ssh"];
    authKeyFile = config.age.secrets."tailscale-authkey".path;
  };

  networking.firewall = enabled {
    trustedInterfaces = [interfaceName];
    allowedUDPPorts = [config.services.tailscale.port];
  };

  environment.systemPackages = [package];
}
