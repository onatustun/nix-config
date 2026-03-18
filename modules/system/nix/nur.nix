{
  flake.modules.nixos = {
    nix = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.nur;
    };

    nur = {
      lib,
      inputs,
      type,
      ...
    }: {
      nixpkgs.overlays = lib.lists.singleton inputs.nur.overlays.default;
      imports = lib.lists.singleton inputs.nur.modules.${type}.default;
    };
  };
}
