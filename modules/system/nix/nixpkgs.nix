{
  flake.modules.nixos = {
    nix = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.nixpkgs;
    };

    nixpkgs = {
      system,
      lib,
      ...
    }: {
      nixpkgs = {
        hostPlatform = {
          inherit system;
        };

        config = {
          allowUnfree = true;
          allowBroken = true;
          allowUnfreePredicate = lib.trivial.const true;
        };
      };
    };
  };
}
