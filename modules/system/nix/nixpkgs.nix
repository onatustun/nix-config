{inputs, ...}: {
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

  perSystem = {system, ...}: {
    imports = ["${inputs.nixpkgs}/nixos/modules/misc/nixpkgs.nix"];

    nixpkgs = {
      config.allowUnfree = true;
      hostPlatform = {inherit system;};
    };
  };
}
