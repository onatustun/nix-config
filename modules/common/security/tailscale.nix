{
  inputs,
  pkgs,
  ...
}: {
  services.tailscale = {
    enable = true;
    package = inputs.tailscale.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
