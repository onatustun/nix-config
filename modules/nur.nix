{
  flake.nixosModules.nur = {inputs, ...}: {
    imports = [inputs.nur.modules.nixos.default];
    nixpkgs.overlays = [inputs.nur.overlays.default];
  };
}
