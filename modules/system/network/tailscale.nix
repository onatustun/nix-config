{lib, ...}: {
  flake.modules.nixos.tailscale = {
    self',
    secretsDir,
    config,
    ...
  }: let
    package = self'.packages.tailscale;
  in {
    age.secrets."tailscale-authkey" = {
      file = "${secretsDir}/nixos/common/tailscale-authkey.age";
      owner = "root";
      group = "root";
      mode = "0400";
    };

    environment.systemPackages = [package];

    services.tailscale = {
      enable = true;
      inherit package;
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

  perSystem = {inputs', ...}: {
    packages.tailscale =
      inputs'.tailscale.packages.default.overrideAttrs
      (lib.const {meta.mainProgram = "tailscale";});
  };
}
