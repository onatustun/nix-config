{
  flake.nixosModules = {
    nix = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.nixpkgs;
    };

    nixpkgs = {lib, ...}: {
      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
        allowUnfreePredicate = lib.trivial.const true;
      };
    };
  };
}
