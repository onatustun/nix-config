{
  flake.nixosModules = {
    nix = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.nixpkgs;
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
