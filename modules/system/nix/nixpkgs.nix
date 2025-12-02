{
  flake.modules.nixos.nixpkgs = {
    system,
    lib,
    ...
  }: {
    nixpkgs = {
      hostPlatform = {inherit system;};

      config = {
        allowUnfree = true;
        allowBroken = true;
        allowUnfreePredicate = lib.trivial.const true;
      };
    };
  };
}
