{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: let
  inherit (lib) enabled;
  interfaceName = "tailscale0";
in {
  age.secrets.tailscaleKey.file = ./tailscale-key.age;
  environment.systemPackages = [inputs.tailscale.packages.${pkgs.stdenv.hostPlatform.system}.default];

  services.tailscale = enabled {
    package = inputs.tailscale.packages.${pkgs.stdenv.hostPlatform.system}.default;
    authKeyFile = config.age.secrets.tailscaleKey.path;
    inherit interfaceName;
    useRoutingFeatures = "both";
    openFirewall = true;
    extraUpFlags = ["--ssh"];
  };

  networking.firewall = enabled {trustedInterfaces = [interfaceName];};
}
