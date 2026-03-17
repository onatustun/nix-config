{
  flake.modules.nixos.nur = {
    inputs,
    type,
    ...
  }: {
    nixpkgs.overlays = [inputs.nur.overlays.default];
    imports = [inputs.nur.modules.${type}.default];
  };
}
