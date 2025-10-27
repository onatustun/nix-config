{inputs', ...}: {
  services.tailscale = {
    enable = true;
    package = inputs'.tailscale.packages.default;
  };
}
