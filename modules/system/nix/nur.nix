{
  flake.nixosModules = {
    nix = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.nur;
    };

    nur = {
      lib,
      inputs,
      ...
    }: {
      nixpkgs.overlays = lib.lists.singleton inputs.nur.overlays.default;
      imports = lib.lists.singleton inputs.nur.modules.nixos.default;
    };
  };
}
