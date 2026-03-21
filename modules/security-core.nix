{
  flake.nixosModules.security-core.security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
