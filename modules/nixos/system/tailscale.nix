{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: let
  inherit (lib) enabled;
  interfaceName = "ts0";
in {
  age.secrets.tailscaleKey.file = ./tailscale-key.age;
  environment.systemPackages = [inputs.tailscale.packages.${pkgs.stdenv.hostPlatform.system}.default];

  services = {
    openssh = enabled;

    tailscale = enabled {
      package = inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default;
      inherit interfaceName;
      useRoutingFeatures = "both";
      openFirewall = true;
      extraUpFlags = ["--ssh"];
      authKeyFile = config.age.secrets.tailscaleKey.path;
    };
  };

  networking.firewall = enabled {trustedInterfaces = [interfaceName];};
}
