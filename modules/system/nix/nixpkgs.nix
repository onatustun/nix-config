{inputs, ...}: {
  flake.modules.nixos = {
    nur = {
      nur,
      type,
      ...
    }: {
      imports = [nur.modules.${type}.default];
    };

    chaotic = {
      chaotic,
      type,
      ...
    }: {
      imports = [chaotic."${type}Modules".default];
    };

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
