{
  flake.nixosModules.nur = {
    lib,
    inputs,
    ...
  }: {
    nixpkgs.overlays = lib.lists.singleton inputs.nur.overlays.default;
    imports = lib.lists.singleton inputs.nur.modules.nixos.default;
  };
}
