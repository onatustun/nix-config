{
  flake.nixosModules.nixpkgs = {lib, ...}: {
    nixpkgs.config = {
      allowUnfree = true;
      allowBroken = true;
      allowUnfreePredicate = lib.trivial.const true;
    };
  };
}
