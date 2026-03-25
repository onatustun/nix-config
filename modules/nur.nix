{
  flake.nixosModules.nur = {
    lib,
    inputs,
    ...
  }: {
    imports = lib.lists.singleton inputs.nur.modules.nixos.default;
    nixpkgs.overlays = lib.lists.singleton inputs.nur.overlays.default;
  };
}
