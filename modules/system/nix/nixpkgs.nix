{inputs, ...}: {
  flake.modules.nixos = {
    nur.imports = [inputs.nur.modules.nixos.default];

    nixpkgs = {
      overlays',
      lib,
      ...
    }: {
      nixpkgs = {
        overlays = overlays';

        config = {
          allowUnfree = true;
          allowBroken = true;
          allowUnfreePredicate = lib.trivial.const true;
        };
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
