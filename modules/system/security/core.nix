{
  flake.modules.nixos.security-core.security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
