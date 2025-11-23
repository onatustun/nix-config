{
  flake.modules.nixos.nur = {
    nur,
    type,
    ...
  }: {
    nixpkgs.overlays = [nur.overlays.default];
    imports = [nur.modules.${type}.default];
  };
}
